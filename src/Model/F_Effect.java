package Model;

import java.io.Serializable;

public class F_Effect extends Effect implements Serializable {

    private static final long serialVersionUID = 1L;
    //private int _effectFFunc;
    //public int FValue(){return _effectFFunc;}

    public int EffectFFunc;

    public F_Effect() {
        super();
    }

    public F_Effect(String name) {
        super(name);
        EffectFFunc = 0;
    }

    public F_Effect(String name, int fValue) {
        super(name);
        EffectFFunc = fValue;
    }
}
