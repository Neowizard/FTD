package XML;

import java.util.ArrayList;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import Model.*;

import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.io.xml.DomDriver;

public class XMLSerializer {

    /**
     * Main method to test the conversion of XML into Java Objects and Java
     * Objects into XML
     *
     * @param args
     * <p/>
     * <p/>
     * public static void main(String[] args) {
     * <p/>
     * System.out.println(
     * "------------------------------------------------");
     * System.out
     * .println("------------------------------------------------");
     * <p/>
     * //CreateXmlBaseDomain(); //CreateXmlBaseProblem();
     * <p/>
     * File fileDomainOmlette = new
     * File("./ProbFiles/omlette_domain_typed.xml"); //File
     * fileDomainOmlette = new File("./ProbFiles/dom_temp.xml");
     * InputDomain omletteDom =
     * (InputDomain)toObjectDomain(fileDomainOmlette);
     * <p/>
     * File fileOmletteProblem = new
     * File("./ProbFiles/problem1__typed.xml"); //File
     * fileOmletteProblem = new File("./ProbFiles/prob_temp.xml");
     * InProblem omletteProb =
     * (InProblem)toObjectProblem(fileOmletteProblem);
     * <p/>
     * Domain outDomain = new Domain("Omlette"); Problem outProb =
     * new Problem("prob1", "Omlette");
     * <p/>
     * Converter conv = new Converter();
     * <p/>
     * conv.Compile(omletteDom, omletteProb, outDomain, outProb, 3);
     * <p/>
     * outDomain.toPDDL("./ProbFiles/testDom.pddl");
     * outProb.toPDDL("./ProbFiles/testProb.pddl");
     * <p/>
     * <p/>
     * }
     */

    private static String NumType = "number";
    private static String bowlType = "bowl";

    // private static String NoType = "no";

    private static void CreateXmlBaseDomain() {

        InputDomain domain = new InputDomain();

        domain.Name = "Omlette";
        domain.ObjectTypes.add(bowlType);
        domain.ObjectTypes.add(NumType);
        domain.Predicates.add(new Literal("unspoiled", LiteralType.Pos));
        domain.Predicates.add(new Literal("holding", LiteralType.Pos));
        domain.Predicates.add(new Literal("bowl", LiteralType.Pos));
        ArrayList<Parameter> nums = new ArrayList<Parameter>();
        nums.add(new Parameter("?no1", true, "no"));
        nums.add(new Parameter("?no2"));
        nums.add(new Parameter("?no3"));
        domain.Predicates.add(new Literal("sum", LiteralType.Pos, nums));

        NonDeterministicAction act = new NonDeterministicAction();
        Effect eff0 = new Effect();
        F_Effect eff1 = new F_Effect();
        // ArrayList<Parameter> actParam = new ArrayList<Parameter>();
        // ArrayList<Literal> actPre = new ArrayList();
        ArrayList<Effect> actEff = new ArrayList();

        act.Params.add(new Parameter("?bowl", true, bowlType));
        act.Params.add(new Parameter("?eggs-before", true, NumType));
        act.Params.add(new Parameter("?eggs-after", true, NumType));

        act.PreConditions.add(new Literal("bowl", LiteralType.Pos));

        act.Name = "break-in";
        eff0.Name = "e0";
        eff0.AddedLiterals.add(new Literal("has"));
        eff0.DeletedLiterals.add(new Literal("has"));

        eff1.Name = "e1";
        eff1.DeletedLiterals.add(new Literal("unspoiled"));

        act.Effects.add(eff0);
        act.NonDetEffects.add(eff1);

        domain.Actions.add(act);

        // System.out.println(toXML(domain));

        File fileDomain = new File("./ProbFiles/dom_temp.xml");

        stringToFile(toXML(domain).toString(), fileDomain);

    }

    private static void CreateXmlBaseProblem() {
        InProblem prob = new InProblem("omlette-3", "Omlette");

        prob.Objects.add(new Parameter("bowl1", true, bowlType));
        prob.Objects.add(new Parameter("bowl2", true, bowlType));
        prob.Objects.add(new Parameter("n0", true, NumType));
        prob.Objects.add(new Parameter("n2", true, NumType));
        prob.Objects.add(new Parameter("n1", true, NumType));
        prob.Objects.add(new Parameter("n3", true, NumType));

        Literal bowl1 = new Literal("bowl");
        bowl1.Params.add(new Parameter("bowl1"));
        prob.InitNotDependedState.add(bowl1);
        Literal bowl2 = new Literal("bowl");
        bowl2.Params.add(new Parameter("bowl2"));
        prob.InitNotDependedState.add(bowl2);
        Literal n1 = new Literal("no");
        n1.Params.add(new Parameter("no"));
        prob.InitNotDependedState.add(n1);
        Literal has1 = new Literal("has");
        has1.Params.add(new Parameter("bowl1"));
        has1.Params.add(new Parameter("n0"));
        prob.InitState.add(has1);

        Literal has1goal = new Literal("has");
        has1goal.Params.add(new Parameter("bowl2"));
        has1goal.Params.add(new Parameter("n3"));
        prob.GoalState.add(has1goal);
        Literal unspoiled = new Literal("unspoiled");
        unspoiled.Params.add(new Parameter("bowl2"));
        prob.GoalState.add(unspoiled);

        // System.out.println(toXML(prob));
        File file = new File("./ProbFiles/prob_temp.xml");
        stringToFile(toXML(prob).toString(), file);
    }

    /**
     * This method is to convert Java Objects into XML
     *
     * @param Problem
     * @return XML as String
     */
    public static String toXML(Problem Problem) {
        XStream xstream = new XStream(new DomDriver());
        xstream.alias("Problem", InProblem.class);
        xstream.alias("Parameter", Parameter.class);
        // xstream.alias("Action", Action.class);
        xstream.alias("Literal", Literal.class);
        // xstream.alias("Effect", Effect.class);
        return xstream.toXML(Problem);
    }

    /**
     * This method is to convert Java Objects into XML
     *
     * @param domain
     * @return XML as String
     */
    public static String toXML(Domain domain) {
        XStream xstream = new XStream(new DomDriver());
        xstream.alias("Domain", InputDomain.class);
        xstream.alias("NonDetAction", NonDeterministicAction.class);
        // xstream.alias("Predicates", Predicate.class);
        xstream.alias("Parameter", Parameter.class);
        xstream.alias("Literal", Literal.class);
        xstream.alias("Action", Action.class);
        xstream.alias("Effect", Effect.class);
        xstream.alias("F_Effect", F_Effect.class);
        return xstream.toXML(domain);
    }

    /**
     * This method is to convert XML into Problem Object
     *
     * @param inputXML as String
     * @return Problem
     */
    public static Problem toObjectProblem(File inputXML) {
        XStream xstream = new XStream(new DomDriver());
        xstream.alias("Problem", InProblem.class);
        xstream.alias("Parameter", Parameter.class);
        // xstream.alias("Domain", InputDomain.class);
        // xstream.alias("Action", Action.class);
        // xstream.alias("Literal", Literal.class);
        // xstream.alias("Effect", Effect.class);

        xstream.alias("Literal", Literal.class);
        // return (!isEmpty(inputXML))?(Problem)xstream.fromXML(inputXML):null;
        return (!isEmpty(inputXML)) ? (Problem) xstream.fromXML(inputXML)
                : null;
    }

    /**
     * This method is to convert XML into Domain Object
     *
     * @param inputXML as String
     * @return Problem
     */
    public static Domain toObjectDomain(File inputXML) {
        XStream xstream = new XStream(new DomDriver());
        xstream.alias("Domain", Model.InputDomain.class);
        // xstream.alias("Predicates", Predicate.class);
        xstream.alias("Parameter", Parameter.class);
        xstream.alias("Literal", Literal.class);
        xstream.alias("Action", Action.class);
        xstream.alias("NonDetAction", NonDeterministicAction.class);
        xstream.alias("Effect", Effect.class);
        xstream.alias("F_Effect", F_Effect.class);
        return (!isEmpty(inputXML)) ? (Domain) xstream.fromXML(inputXML) : null;
    }

    /**
     * This method is to check object passed is empty or not
     *
     * @param input
     * @return boolean [true or false]
     */
    private static boolean isEmpty(Object input) {
        return input == null || "".equals(input.toString().trim());
    }

    private static void stringToFile(String s, File file) {

        FileOutputStream fop = null;

        try {

            fop = new FileOutputStream(file);

            // if file doesn't exists, then create it
            if (!file.exists()) {
                file.createNewFile();
            }

            // get the content in bytes
            byte[] xmlContentInByte = s.getBytes();

            fop.write(xmlContentInByte);
            fop.flush();
            fop.close();

            // System.out.println("Done");

        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if (fop != null) {
                    fop.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

    }

}