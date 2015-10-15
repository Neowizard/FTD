package Main;

import java.io.File;
import java.io.IOException;

import Converter.Converter;
import Model.Domain;
import Model.InProblem;
import Model.InputDomain;
import Model.Problem;
import XML.XMLSerializer;

public class FTPlaningCompMain {

    /**
     * @param args
     */
    public static void main(String[] args) {

        // Checks property file
        if (args.length == 0) {
            System.out.println("Proper Usage is: java program param_file");
            System.exit(0);
        }

        // load property file
        try {
            ConfigurationManager propConfig = new ConfigurationManager(args[0]);

            File fileDomainXml = new File(propConfig.getProperty("domain"));
            InputDomain InputDom = (InputDomain) XMLSerializer
                    .toObjectDomain(fileDomainXml);

            File fileProblemXml = new File(propConfig.getProperty("problem"));
            InProblem InputProb = (InProblem) XMLSerializer
                    .toObjectProblem(fileProblemXml);

            Domain outDomain = new Domain(propConfig.getProperty("domName"));
            Problem outProb = new Problem(propConfig.getProperty("probName"),
                    propConfig.getProperty("domName"));

            Converter conv = new Converter();

            int k = Integer.parseInt(propConfig.getProperty("k"));

            conv.Compile(InputDom, InputProb, outDomain, outProb, k);

            outDomain.toPDDL(propConfig.getProperty("domOutput"));
            outProb.toPDDL(propConfig.getProperty("probOutput"));

            System.out.println("Compilation completed successfully");

        } catch (IOException e) {
            System.out
                    .println("The system encounter exception : " + e.toString());

        }

    }

}
