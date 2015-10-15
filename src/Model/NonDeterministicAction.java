package Model;

import java.io.BufferedWriter;
import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;

public class NonDeterministicAction extends Action implements Serializable {

    private static final long serialVersionUID = 1L;
    public ArrayList<F_Effect> NonDetEffects;

    public NonDeterministicAction() {
        super();
        NonDetEffects = new ArrayList<F_Effect>();
    }

    public NonDeterministicAction(String name) {
        super(name);
        this.NonDetEffects = new ArrayList<>();
    }

    public NonDeterministicAction(String name, ArrayList<Parameter> params, ArrayList<Literal> preConditions, ArrayList<Effect> effects, ArrayList<F_Effect> nonDetEffects) {
        super(name, params, preConditions, effects);
        this.NonDetEffects = nonDetEffects;
    }

    public void toPDDL(BufferedWriter bufferedWriter) throws IOException {
        //begin action
        bufferedWriter.write("\t(:action " + Name);
        bufferedWriter.newLine();

        //write parameters
        if (Params.size() > 0) {
            bufferedWriter.write("\t:parameters ");
            bufferedWriter.write("(");
            for (Parameter param : Params) {
                bufferedWriter.write(" " + param.toPDDL());
            }
            bufferedWriter.write(")");
            bufferedWriter.newLine();
        }

        //write PreConditions
        if (PreConditions.size() > 0) {
            bufferedWriter.write("\t:precondition ");
            bufferedWriter.newLine();
            bufferedWriter.write("\t(" + ((PreConditions.size() > 1) ? "and" : ""));
            bufferedWriter.newLine();
            for (Literal lit : PreConditions) {
                bufferedWriter.write("\t");
                bufferedWriter.write(lit.toPDDL());
                bufferedWriter.newLine();
            }

            bufferedWriter.write("\t)");
            bufferedWriter.newLine();
        }

        //write Effects
        if (Effects.size() > 0 || NonDetEffects.size() > 0) {
            bufferedWriter.write("\t:effect ");
            bufferedWriter.newLine();
            bufferedWriter.write("\t( " + ((Effects.size() + NonDetEffects.size() > 1) ? "and" : " "));
            bufferedWriter.newLine();
            for (Effect eff : Effects) {
                bufferedWriter.write("\t");
                bufferedWriter.write(eff.toPDDL());
                bufferedWriter.newLine();
            }

            for (F_Effect eff : NonDetEffects) {
                bufferedWriter.write("\t(nondet ");
                bufferedWriter.write(eff.toPDDL());
                bufferedWriter.write(")");
                bufferedWriter.newLine();
            }

            bufferedWriter.write("\t)");
        }

    }
}
