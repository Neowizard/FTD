package Model;

import java.io.BufferedWriter;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;

public class Problem implements Serializable {

    private static final long serialVersionUID = 1L;
    public String Name;
    public String DomainName;
    public ArrayList<Parameter> Objects;
    public ArrayList<Literal> InitState;
    public ArrayList<Literal> GoalState;

    public Problem() {
        this("Default name", "Default domain");
    }

    public Problem(String name, String domainName) {
        this.Name = name;
        this.DomainName = domainName;
        this.Objects = new ArrayList<Parameter>();
        this.InitState = new ArrayList<Literal>();
        this.GoalState = new ArrayList<Literal>();
    }

    public Problem(String name, String domainName, ArrayList<Parameter> objects, ArrayList<Literal> initState, ArrayList<Literal> goalState) {
        this.Name = name;
        this.DomainName = domainName;
        this.Objects = objects;
        this.InitState = initState;
        this.GoalState = goalState;
    }

    public String toString() {
        String repString = "Problem '" + Name + "'\r\nDomain: " + DomainName + "\r\nObjects:\r\n ";

        for (Parameter obj : Objects) {
            repString = repString + obj + "\r\n";
        }
        repString += "InitState:\r\n";
        for (Literal lit : InitState) {
            repString = repString + lit.toString() + "\r\n";
        }
        repString += "GoalState:\r\n";
        for (Literal lit : GoalState) {
            repString = repString + lit.toString() + "\r\n";
        }
        return repString;
    }

    public void toPDDL(String filename) {

        BufferedWriter bufferedWriter = null;

        try {

            bufferedWriter = new BufferedWriter(new FileWriter(filename));
            // begin domain
            bufferedWriter.write("(define (problem " + Name + ")");
            bufferedWriter.newLine();
            bufferedWriter.write("(:domain " + DomainName + ")");
            bufferedWriter.newLine();

            // begin objects
            bufferedWriter.newLine();
            bufferedWriter.write("(:objects ");
            for (Parameter obj : Objects) {
                bufferedWriter.newLine();
                bufferedWriter.append("\t" + obj.toPDDL());
            }
            //end objects
            bufferedWriter.newLine();
            bufferedWriter.write(")");
            bufferedWriter.newLine();

            // begin Init
            bufferedWriter.newLine();
            bufferedWriter.write("(:init");
            for (Literal lit : InitState) {
                bufferedWriter.newLine();
                bufferedWriter.write("\t" + lit.toPDDL());
            }
            // end Init
            bufferedWriter.newLine();
            bufferedWriter.write(")");

            // begin Goal
            bufferedWriter.newLine();
            bufferedWriter.newLine();
            bufferedWriter.write("(:goal");
            if (GoalState.size() > 1) {
                bufferedWriter.newLine();
                bufferedWriter.write("(and");
            }
            for (Literal lit : GoalState) {
                bufferedWriter.newLine();
                bufferedWriter.write("\t" + lit.toPDDL());
            }
            if (GoalState.size() > 1) {
                bufferedWriter.newLine();
                bufferedWriter.write(")");
            }
            // end Goal
            bufferedWriter.newLine();
            bufferedWriter.write(")");

            // end problem
            bufferedWriter.newLine();
            bufferedWriter.write(")");

        } catch (FileNotFoundException ex) {
            ex.printStackTrace();
        } catch (IOException ex) {
            ex.printStackTrace();
        } finally {
            //Close the BufferedWriter
            try {
                if (bufferedWriter != null) {
                    bufferedWriter.flush();
                    bufferedWriter.close();
                }
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
    }
}
