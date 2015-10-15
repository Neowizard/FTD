package Model;

import java.io.Serializable;
import java.util.ArrayList;

public class InputDomain extends Domain implements Serializable {

    private static final long serialVersionUID = 1L;
    public ArrayList<Literal> NotDependedPredicates;

    public InputDomain() {
        super();
        this.NotDependedPredicates = new ArrayList<Literal>();
    }

    public InputDomain(String name) {
        super(name);
        this.Actions = new ArrayList<Action>();
        this.NotDependedPredicates = new ArrayList<Literal>();
    }

    public InputDomain(String name, ArrayList<String> types, ArrayList<Literal> predicates, ArrayList<Action> actions, ArrayList<Literal> nonDependedPredicates) {
        super(name, types, predicates, actions);
        this.NotDependedPredicates = nonDependedPredicates;
    }
}
