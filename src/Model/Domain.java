package Model;

import java.io.BufferedWriter;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;

public class Domain implements Serializable {

    private static final long serialVersionUID = 1L;
    public String Name;
    public ArrayList<String> ObjectTypes;
    public ArrayList<Literal> Predicates;
    public ArrayList<Action> Actions;

    public Domain() {
        this("Default name");
    }

    public Domain(String name) {
        this.Name = name;
        this.Predicates = new ArrayList<Literal>();
        this.Actions = new ArrayList<Action>();
        this.ObjectTypes = new ArrayList<String>();
    }

    public Domain(String name, ArrayList<String> types, ArrayList<Literal> predicates, ArrayList<Action> actions) {
        this.Name = name;
        this.Predicates = predicates;
        this.Actions = actions;
        this.ObjectTypes = types;
    }

    public String toString() {
        String repString = "Domain '" + Name + "'\r\n";

        repString += "Types:\r\n";
        for (String type : ObjectTypes) {
            repString = repString + type.toString() + "\r\n";
        }
        repString += "Predicates:\r\n";
        for (Literal lit : Predicates) {
            repString = repString + lit.toString() + "\r\n";
        }

        repString += "Actions:\r\n";
        for (Action act : Actions) {
            repString = repString + act.toString() + "\r\n";
        }

        return repString;
    }

    public void toPDDL(String filename) {

        BufferedWriter bufferedWriter = null;

        try {

            bufferedWriter = new BufferedWriter(new FileWriter(filename));
            // begin domain
            bufferedWriter.write("(define (domain " + Name + ")");
            bufferedWriter.newLine();
            // begin requirements
            bufferedWriter.write("(:requirements :equality :negative-preconditions :typing)");
            bufferedWriter.newLine();
            // begin types
            bufferedWriter.write("\t(:types");
            for (String type : ObjectTypes) {
                bufferedWriter.write(" " + type);
            }
            // end predicates
            bufferedWriter.write(")");
            bufferedWriter.newLine();

            // begin predicates
            bufferedWriter.write("\t(:predicates");
            bufferedWriter.newLine();

            for (Literal lit : Predicates) {
                bufferedWriter.write("\t\t");
                bufferedWriter.write(lit.toPDDL());
                bufferedWriter.newLine();
            }

            // end predicates
            bufferedWriter.write("\t)");

            // begin Action

            for (Action act : Actions) {
                bufferedWriter.newLine();
                act.toPDDL(bufferedWriter);
            }
            // end Action


            // end domain
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
