package Main;

import Parser.javaff.data.UngroundProblem;
import Parser.javaff.parser.*;
import Model.Action;

import java.io.*;
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

    public static void ParseInput(String[] args) {
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

        ParseInput(args);

        ConvertProps(inDomain, inProblem);
        ConvertDomain(inDomain);
        ConvertProblem(inProblem);

        System.out.println("Wrote Properties XML to " + outPropPath);
        System.exit(0);
    }
/*
    private static void ConvertProblem(Problem inProblem) {
    }

    private static Model.Domain ConvertDomain(Domain inDomain) {
        Model.Domain convDomain = new Model.Domain(inDomain.getName().toString());
        for (TypedSymbol type : inDomain.getTypes()){
            convDomain.ObjectTypes.add(type.toString());
        }
        for (NamedTypedList pred : inDomain.getPredicates()){
        }

        for (Op operation : inDomain.getOperators()){
            convDomain.Actions.add(convertOperation(operation));
        }

        return convDomain;
    }

    private static Action convertOperation(Op operation) {
        Action convAction = new Action(operation.getName().toString());

        return convAction;
    }

    private static void ConvertProps(Domain inDomain, Problem inProblem) {
        Properties props = new Properties();
        props.put("k", Integer.toString(maxFaults));
        props.put("domain", outDomainPath);
        props.put("problem", outProblemPath);

        props.put("domName", inDomain.getName().toString());
        props.put("probName", inProblem.getName().toString());

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
    }*/
}
