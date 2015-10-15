package Model;

import java.io.Serializable;

public class Parameter implements Serializable {

    private static final long serialVersionUID = 1L;

    public String Name;
    public Boolean IsTypedParam;
    public String ParamType;

    public Parameter(String name) {
        this(name, false, "");
    }

    public Parameter(String name, Boolean isTyped, String type) {
        this.Name = name;
        this.IsTypedParam = isTyped;
        this.ParamType = type;
    }

    public Parameter Clone() {
        Parameter newParam = new Parameter(this.Name, this.IsTypedParam, this.ParamType);
        return newParam;
    }

    public String toString() {

        String repString = Name;

        if (IsTypedParam)
            repString += " - " + ParamType;

        return repString;
    }

    public String toPDDL() {

        return this.toString();
    }
}
