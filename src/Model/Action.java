package Model;

import java.io.BufferedWriter;
import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;

public class Action implements Serializable {

    private static final long serialVersionUID = 1L;
    public String Name;
    public ArrayList<Parameter> Params;
    public ArrayList<Literal> PreConditions;
    public ArrayList<Effect> Effects;

    public Action() {
        this("Default name");
    }

    public Action(String name) {
        this.Name = name;
        this.Params = new ArrayList<>();
        this.PreConditions = new ArrayList<>();
        this.Effects = new ArrayList<>();
    }

    public Action(String name, ArrayList<Parameter> params, ArrayList<Literal> preConditions, ArrayList<Effect> effects) {
        this.Name = name;
        this.Params = params;
        this.PreConditions = preConditions;
        this.Effects = effects;
    }

    public String toString() {
        String repString = Name + " \r\nParameters:\r\n";

        for (Parameter param : Params) {
            repString += param;
        }

        repString += "PreConditions:\r\n";
        for (Literal lit : PreConditions) {
            repString = repString + lit.toString() + "\r\n";
        }

        repString += "Effects:\r\n";
        for (Effect eff : Effects) {
            repString = repString + eff.toString() + "\r\n";
        }
        return repString;
    }

    public void toPDDL(BufferedWriter bufferedWriter) throws IOException {

        bufferedWriter.newLine();
        //begin action
        bufferedWriter.write("\t(:action " + Name);
        bufferedWriter.newLine();

        bufferedWriter.write("\t:parameters ");
        bufferedWriter.write(" (");
        //write parameters
        if (Params.size() > 0)
            for (Parameter param : Params)
                bufferedWriter.write(" " + param.toPDDL());

        bufferedWriter.write(")");
        bufferedWriter.newLine();


        //write PreConditions
        bufferedWriter.write("\t:precondition ");
        bufferedWriter.newLine();
        bufferedWriter.write("\t\t(");
        if (PreConditions.size() > 0) {
            bufferedWriter.write(((PreConditions.size() > 1) ? "and" : ""));
            bufferedWriter.newLine();
            for (Literal lit : PreConditions) {
                bufferedWriter.write("\t\t");
                bufferedWriter.write(lit.toPDDL());
                bufferedWriter.newLine();
            }

        }

        bufferedWriter.write("\t\t)");
        bufferedWriter.newLine();


        //write Effects
        bufferedWriter.write("\t:effect ");
        bufferedWriter.newLine();
        bufferedWriter.write("\t\t");
        if (Effects.size() > 0) {
            bufferedWriter.write(((Effects.size() > 1) ? "(and" : " "));
            bufferedWriter.newLine();
            for (Effect eff : Effects) {
                bufferedWriter.write("\t\t");
                bufferedWriter.write(eff.toPDDL());
                bufferedWriter.newLine();
            }
            bufferedWriter.write(((Effects.size() > 1) ? "\t\t)" : " "));
        }

        //bufferedWriter.write("\t\t)");


        bufferedWriter.newLine();
        bufferedWriter.write("\t)");


    }
}
