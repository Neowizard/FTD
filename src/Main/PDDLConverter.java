package Main;

import Converter.Converter;
import Model.InputDomain;
import Model.InProblem;
import Model.EffectType;
import Model.NonDeterministicAction;
import Model.Effect;
import Model.F_Effect;
import Model.Action;
import Model.LiteralType;
import Model.Literal;
import Model.Parameter;
import Model.Domain;
import Model.Problem;


import Parser.Symbol;
import Parser.Op;
import Parser.Connective;
import Parser.Exp;
import Parser.NamedTypedList;
import Parser.TypedSymbol;
import XML.XMLSerializer;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.OpenOption;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

/**
 * Created by neowizard on 10/14/15.
 */
public class PDDLConverter {

    private static boolean forward = false;

    private static String outDomainPath = "./domain.xml";
    private static String outProblemPath = "./problem.xml";
    private static String outPropPath = "./properties.xml";

    private static String inDomainPath = null;
    private static String inProblemPath = null;
    private static int maxFaults = 0;

    private static void PrintUsage() {
        System.out.println("PDDL to XML converter to be used with the Fault Tolerant Compiler");
        System.out.println("Creates 3 XML files domain.xml, problem.xml and properties.xml");
        System.out.println("Usage:");
        System.out.println("\t<java run command> [-f] [-d <domain>] [-p <problem>] [-o <properties>] " +
                "<domain pddl file> <problem pddl path> <max faults>");
        System.out.println("Note: the first non-option argument is treated as the domain PDDL file, the second " +
                "as the problem PDDL and the third as the man number of faults");
        System.out.println("Options:");
        System.out.println("\t-f\t-\tForward converted output to Fault Tolerant Compiler");
        System.out.println("\t-d <domain path>\t-\toutput the domain XML to <domain path> (instead of ./domain.xml");
        System.out.println("\t-p <problem path>\t-\toutput the problem XML to <domain path>");
        System.out.println("\t-o <properties path>\t-\toutput the properties XML to <domain path>");
    }

    public static void ParseArgs(String[] args) {
        boolean domainPathSet = false;
        boolean problemPathSet = false;
        for (int arg_idx = 0; arg_idx < args.length; arg_idx++) {
            if (args[arg_idx].charAt(0) == '-') {
                if (args[arg_idx].length() <= 2) {
                    switch (args[arg_idx].charAt(1)) {
                        case 'f':
                            forward = true;
                            break;
                        case 'd':
                            arg_idx++;
                            outDomainPath = args[arg_idx];
                            break;
                        case 'p':
                            arg_idx++;
                            outProblemPath = args[arg_idx];
                            break;
                        case 'o':
                            arg_idx++;
                            outPropPath = args[arg_idx];
                            break;
                        default:
                            System.out.println("Unknown option " + args[arg_idx] + " at index " + arg_idx +
                                    " Quitting...");
                            System.exit(2);
                    }
                } else {
                    System.out.println("Invalid option " + args[arg_idx] + " at index " + arg_idx + " Quitting...");
                    System.exit(2);
                }
            } else {
                if (domainPathSet == false) {
                    inDomainPath = args[arg_idx];
                    domainPathSet = true;
                } else if (problemPathSet == false) {
                    inProblemPath = args[arg_idx];
                    problemPathSet = true;
                } else {
                    maxFaults = Integer.parseInt(args[arg_idx]);
                }
            }
        }
    }

    public static void main(String[] args) {
        // Checks property file
        if (args.length < 3) {
            PrintUsage();
            System.exit(1);
        }

        ParseArgs(args);

        Parser.Parser parser = new Parser.Parser();
        try {
            parser.parse(inDomainPath, inProblemPath);
        } catch (FileNotFoundException e) {
            System.out.println("Failed to open input domain or problem files for parsing\n" + e.toString());
            e.printStackTrace();
        }


        ConvertProps(parser);
        InputDomain outDomain = new InputDomain();
        ConvertDomain(parser, outDomain);
        InProblem outProblem = new InProblem();
        ConvertProblem(parser, outProblem);

        String domainXml = XMLSerializer.toXML(outDomain);
        String problemXml = XMLSerializer.toXML(outProblem);

        try {
            Files.write(Paths.get(outProblemPath), problemXml.getBytes());
            Files.write(Paths.get(outDomainPath), domainXml.getBytes());
        } catch (IOException e) {
            System.out.println("Failed to write output domain or problem files.\n" + e.toString());
            e.printStackTrace();
        }

        if (forward) {
            String[] compilerArgs = {outPropPath};
            FTPlaningCompMain.main(compilerArgs);
        }


        System.exit(0);
    }

    private static Problem ConvertProblem(Parser.Parser parser, Problem convProblem) {
        Parser.Problem inProblem = parser.getProblem();
        Parser.Domain inDomain = parser.getDomain();

        convProblem.Name = inProblem.getName().toString();
        convProblem.DomainName = inDomain.getName().toString();

        for (TypedSymbol probObj : inProblem.getObjects()) {
            convProblem.Objects.add(new Parameter(probObj.getImage(), true, probObj.getTypes().get(0).getImage()));
        }


        List<Literal> convInitState = convertState(inProblem.getInit());
        convProblem.InitState.addAll(convInitState);

        // Currently goal states are handled by convertState, so they share its limitations
        // And require the same input format
        Exp goalStateWrapper = new Exp(Connective.AND);
        goalStateWrapper.addChild(inProblem.getGoal());
        List<Literal> convGoal = convertState(goalStateWrapper.getChildren());
        convProblem.GoalState.addAll(convGoal);

        return convProblem;
    }

    private static Domain ConvertDomain(Parser.Parser parser, Domain convDomain) {
        Parser.Domain inDomain = parser.getDomain();
        convDomain.Name = inDomain.getName().toString();

        for (TypedSymbol type : inDomain.getTypes()) {
            String typeStr = type.toString().substring(0, type.toString().indexOf('-'));
            typeStr = typeStr.trim();
            convDomain.ObjectTypes.add(typeStr);
        }
        for (NamedTypedList pred : inDomain.getPredicates()) {

            ArrayList<Parameter> convParams = new ArrayList<>();
            for (TypedSymbol arg : pred.getArguments()) {
                convParams.add(new Parameter(arg.getImage(), true, arg.getTypes().get(0).getImage()));
            }

            convDomain.Predicates.add(new Literal(pred.getName().toString(), LiteralType.Pos, convParams));
        }

        for (Op operation : inDomain.getOperators()) {
            convDomain.Actions.add(convertOperation(operation));
        }

        return convDomain;
    }

    private static Action convertOperation(Op operation) {
        List<Parameter> convParameters = new ArrayList<>();
        Action convAction;

        for (TypedSymbol param : operation.getParameters()) {
            Parameter convParam = new Parameter(param.getImage(), true, param.getTypes().get(0).getImage());
            convParameters.add(convParam);
        }
        Exp precond = operation.getPreconditions();

        // Partially Normalize the preconditions
        if ((precond.getConnective() == Connective.ATOM) ||
                (precond.getConnective() == Connective.EQUAL_ATOM) ||
                (precond.getConnective() == Connective.NOT)){
            Exp dummyPrecond = new Exp(Connective.AND);
            dummyPrecond.addChild(precond);
            precond = dummyPrecond;
        }
        List<Literal> convPreconds = convertState(precond.getChildren());

        Exp effect = operation.getEffects();
        if (effect.getConnective() == Connective.ONEOF) {
            NonDeterministicAction nonDetConvAction = new NonDeterministicAction(operation.getName().getImage());
            List<Exp> children = effect.getChildren();
            for (int i = 0; i < children.size(); i++) {
                Exp nondetEffect = children.get(i);
                F_Effect convEffect = convertNonDetEffect(nondetEffect, "e" + i);
                nonDetConvAction.NonDetEffects.add(convEffect);
            }
            convAction = nonDetConvAction;
        }
        else {
            convAction = new Action(operation.getName().getImage());
            Effect convEffect = convertEffect(effect, "det");
            convAction.Effects.add(convEffect);
        }

        convAction.PreConditions.addAll(convPreconds);
        convAction.Params.addAll(convParameters);

        return convAction;
    }

    /*
     * Currently only handles conjunctive effects and single-predicate-negation (delete effects)
     */
    private static F_Effect convertNonDetEffect(Exp effect, String name) {
        F_Effect convEffect = new F_Effect();
        convertEffectBody(effect, convEffect, name);
        convEffect.EffectFFunc = 0; /* TODO: Use in a meaningful usage? */
        return convEffect;
    }

    /*
     * Currently only handles conjunctive effects and single-predicate-negation (delete effects)
     */
    private static Effect convertEffect(Exp effect, String name) {
        Effect convEffect = new Effect();
        convertEffectBody(effect, convEffect, name);
        return convEffect;
    }

    /*
     * Currently only handles conjunctive effects and single-predicate-negation (delete effects)
     */
    private static Effect convertEffectBody(Exp effect, Effect convEffect, String name) {
        convEffect.EffType = EffectType.Single; /* We don't support "forall" expressions */
        convEffect.Name = name;

        // Partially Normalize the effect
        if ((effect.getConnective() == Connective.ATOM) ||
                (effect.getConnective() == Connective.EQUAL_ATOM) ||
                (effect.getConnective() == Connective.NOT)){
            Exp dummyPrecond = new Exp(Connective.AND);
            dummyPrecond.addChild(effect);
            effect = dummyPrecond;
        }

        convertSubEffects(effect.getChildren(), convEffect.AddedLiterals, convEffect.DeletedLiterals);
        return convEffect;
    }

    private static void convertSubEffects(List<Exp> subEffs, List<Literal> addedLiterals, List<Literal> deletedLiterals) {
        for (Exp subEff : subEffs) {

            // Add or Delete effect?
            List<Literal> effTypeList = addedLiterals;
            if (subEff.getConnective() == Connective.NOT) {
                effTypeList = deletedLiterals;
                subEff = subEff.getChildren().get(0);
                if (subEff.getConnective() == Connective.AND) {
                    throw new UnsupportedOperationException("Can't convert effect with " +
                            subEff.getConnective().toString() +
                            " at current context (not implemented)");
                }
            }

            if (subEff.getConnective() == Connective.ATOM) {
                List<Symbol> effBody = subEff.getAtom();
                Literal convSubEff = new Literal(effBody.get(0).toString(), LiteralType.Pos);
                for (Symbol param : effBody.subList(1, effBody.size())) {
                    convSubEff.Params.add(new Parameter(param.getImage(), false, ""));
                }
                effTypeList.add(convSubEff);
            }
            else if (subEff.getConnective() == Connective.AND)
            {
                convertSubEffects(subEff.getChildren(), addedLiterals, deletedLiterals);
            }
            else {
                throw new UnsupportedOperationException("Can't convert effect with " +
                        subEff.getConnective().toString() +
                        " at current context (not implemented)");
            }
        }
    }

    /*
     * Currently only handles conjunctive preconditions with equality and single-predicate-negation.
     */
    private static List<Literal> convertState(List<Exp> stateVars) {
        List<Literal> convPreconds = new ArrayList<>();

        for (Exp subCond : stateVars) {
            // Positive or negative precondition?
            LiteralType condType = LiteralType.Pos;
            if (subCond.getConnective() == Connective.NOT) {
                condType = LiteralType.Neg;
                subCond = subCond.getChildren().get(0);
            }

            if (subCond.getConnective() == Connective.ATOM) {
                List<Symbol> precondBody = subCond.getAtom();
                Literal convPrecond = new Literal(precondBody.get(0).toString(), condType);
                for (Symbol param : precondBody.subList(1, precondBody.size())) {
                    convPrecond.Params.add(new Parameter(param.getImage(), false, ""));
                }
                convPreconds.add(convPrecond);
            }
            // Comparison to "EQUAL" unnecessary?
            else if (subCond.getConnective() == Connective.EQUAL_ATOM || subCond.getConnective() == Connective.EQUAL) {
                Literal convPrecond = new Literal("=", condType);
                for (Symbol param : subCond.getAtom()) {
                    convPrecond.Params.add(new Parameter(param.getImage(), false, ""));
                }
                convPreconds.add(convPrecond);
            }
            else if (subCond.getConnective() == Connective.AND)
            {
                convPreconds.addAll(convertState(subCond.getChildren()));
            }
            else {
                throw new UnsupportedOperationException("Can't convert preconditions with " +
                        subCond.getConnective().toString() +
                        " at current context (not implemented)");
            }
        }

        return convPreconds;
    }

    private static void ConvertProps(Parser.Parser parser) {

        Properties props = new Properties();
        props.put("k", Integer.toString(maxFaults));
        props.put("domain", outDomainPath);
        props.put("problem", outProblemPath);

        props.put("domName", parser.getDomain().getName().toString());
        props.put("probName", parser.getProblem().getName().toString());

        // TODO: Add custom compiler output path option
        props.put("domOutput", "./outputDom.pddl");
        props.put("probOutput", "./outputProb.pddl");
        FileOutputStream propsStream = null;
        try {
            propsStream = new FileOutputStream(outPropPath);
            props.storeToXML(propsStream, "Generated properties file created by PDDLConverted");
        } catch (FileNotFoundException e) {
            System.err.println("Couldn't write to " + outPropPath + ":\n" + e.toString());
            e.printStackTrace();
        } catch (IOException e) {
            System.err.println("Couldn't write properties XML to " + outPropPath + ":\n" + e.toString());
            e.printStackTrace();
        }

        System.out.println("Wrote Properties XML to " + outPropPath);
    }
}
