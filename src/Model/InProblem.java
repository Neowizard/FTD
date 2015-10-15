package Model;

import java.io.Serializable;
import java.util.ArrayList;

public class InProblem extends Problem implements Serializable {

    private static final long serialVersionUID = 1L;

    public ArrayList<Literal> InitNotDependedState;

    public InProblem() {
        super();
        InitNotDependedState = new ArrayList<Literal>();
    }

    public InProblem(String name, String domainName) {
        super(name, domainName);
        InitNotDependedState = new ArrayList<Literal>();
    }

    public InProblem(String name, String domainName, ArrayList<Parameter> objects,
                     ArrayList<Literal> initState, ArrayList<Literal> goalState, ArrayList<Literal> notDependedInit) {
        super(name, domainName, objects, initState, goalState);
        InitNotDependedState = notDependedInit;
    }

}
