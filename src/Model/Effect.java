package Model;

import java.io.Serializable;
import java.util.ArrayList;


public class Effect implements Serializable {

    //private String _name;
    //public String getName(){return _name;}

    //private ArrayList<Literal> _addedLiterals;
    //private ArrayList<Literal> _deletedLiterals;

    private static final long serialVersionUID = 1L;
    public String Name;
    public EffectType EffType;
    public ArrayList<Parameter> MultiParams;
    public ArrayList<Literal> AddedLiterals;
    public ArrayList<Literal> DeletedLiterals;

    //public Effect Clone(){	}

    public Effect() {
        this("Default name");
    }

    public Effect(String name) {
        this.Name = name;
        EffType = EffectType.Single;
        MultiParams = new ArrayList<Parameter>();
        AddedLiterals = new ArrayList<Literal>();
        DeletedLiterals = new ArrayList<Literal>();
    }

    public Effect(String name, ArrayList<Literal> added, ArrayList<Literal> deleted) {
        this.Name = name;
        this.AddedLiterals = added;
        this.DeletedLiterals = deleted;
        EffType = EffectType.Single;
        MultiParams = new ArrayList<Parameter>();
    }

    public Effect(String name, ArrayList<Literal> added, ArrayList<Literal> deleted, EffectType type, ArrayList<Parameter> multiParams) {
        this.Name = name;
        this.AddedLiterals = added;
        this.DeletedLiterals = deleted;
        EffType = type;
        MultiParams = multiParams;
    }

    public String toString() {
        String repString = Name + " " + EffType.toString() + "\r\nMultiParams:\r\n";

        if (MultiParams != null)
            for (Parameter param : MultiParams) {
                repString += param;
            }

        repString += "AddedLiterals:\r\n";
        if (AddedLiterals != null)
            for (Literal lit : AddedLiterals) {
                repString = repString + lit.toString() + "\r\n";
            }

        repString += "DeletedLiterals:\r\n";
        if (DeletedLiterals != null)
            for (Literal lit : DeletedLiterals) {
                repString = repString + lit.toString() + "\r\n";
            }

        return repString;
    }

    public String toPDDL() {

        String litString = "";
        String paramString = "";
        int litCounter = 0;

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

        litString = ((litCounter > 1) ? "(and " : "") + litString + ((litCounter > 1) ? ")" : "");


        StringBuffer repString = new StringBuffer(litString);

        if (EffType == EffectType.Multi) {
            //if (MultiParams!=null && MultiParams.size()>0)
            paramString = " forall (";
            for (Parameter param : MultiParams) {
                paramString = paramString + param.toPDDL();
            }
            paramString = paramString + ")\r\n ";
            repString.insert(0, paramString);
        }


        return repString.toString();
    }

}
