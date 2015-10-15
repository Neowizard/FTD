package Model;

import java.io.Serializable;
import java.util.ArrayList;

public class Literal implements Serializable {

    //private String _name;
    //public String getName(){return _name;}

    private static final long serialVersionUID = 1L;
    public String Name;
    public LiteralType Type;
    public ArrayList<Parameter> Params;

    public Literal() {
        this("Default name");
    }

    public Literal(String name) {
        this(name, LiteralType.Pos);
    }

    public Literal(String name, LiteralType type) {
        this.Name = name;
        this.Type = type;
        this.Params = new ArrayList<Parameter>();
    }

    public Literal(String name, LiteralType type, ArrayList<Parameter> params) {
        this.Name = name;
        this.Type = type;
        this.Params = params;
    }

    public Literal Clone() {
        Literal clonedLit = new Literal(this.Name, this.Type);
        if (Params != null) {
            for (Parameter param : this.Params) {
                clonedLit.Params.add(param.Clone());
            }
        }
        return clonedLit;
    }


    public String toString() {

        String repString = Name + " " + Type.toString() + "\r\nParameters:\r\n";

        if (Params != null)
            for (Parameter param : Params) {
                repString += param;
            }

        return repString;
    }

    public String toPDDL() {

        StringBuffer repString = new StringBuffer("(" + Name);

        if (Params != null)
            for (Parameter param : Params) {
                repString.append(" " + param.toPDDL());
            }

        if (this.Type == LiteralType.Neg) {
            repString.insert(0, "(not ");
            repString.append(")");
        }

        repString.append(")");

        return repString.toString();
    }
}
