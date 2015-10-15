package Model;

import java.io.BufferedWriter;
import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;


public class ConditionalEffect extends Effect implements Serializable {

    private static final long serialVersionUID = 1L;

    public ArrayList<Literal> Conditions;

    public ConditionalEffect() {
        super();
        Conditions = new ArrayList<>();
    }

    public ConditionalEffect(String name) {
        super(name);
        Conditions = new ArrayList<>();
    }

    public ConditionalEffect(String name, ArrayList<Literal> added, ArrayList<Literal> deleted, ArrayList<Literal> conditions) {
        super(name, added, deleted);
        this.Conditions = conditions;
    }

    public String toPDDL() {
        String litString = "";
        String paramString = "";
        int litCounter = 0;

        if (Conditions != null && Conditions.size() > 0) {
            litString = litString + "\t\t\t(when (";
            if (Conditions.size() > 1)
                litString = litString + "and ";
            for (Literal lit : Conditions) {
                litString = litString + lit.toPDDL() + " ";
            }
            litString = litString + ") ";
        }

        if (AddedLiterals != null)
            for (Literal lit : AddedLiterals) {
                litCounter++;
                litString = litString + lit.toPDDL() + " ";
            }


        if (DeletedLiterals != null)
            for (Literal lit : DeletedLiterals) {
                litCounter++;
                lit.Type = LiteralType.Neg;
                litString = litString + lit.toPDDL() + " ";
            }


        StringBuffer repString = new StringBuffer(litString);

        if (EffType == EffectType.Multi) {

            paramString = "( forall (";
            for (Parameter param : MultiParams) {
                paramString = paramString + " " + param.toPDDL();
            }
            paramString = paramString + ")\r\n";
            repString.insert(0, paramString);
            repString.append("))");
        }


        return repString.toString();
    }
}