package Converter;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Dictionary;
import java.util.InvalidPropertiesFormatException;

import Common.SpecificActions;
import Common.SpecificPredicates;
import Model.Action;
import Model.ConditionalEffect;
import Model.Domain;
import Model.Effect;
import Model.EffectType;
import Model.F_Effect;
import Model.InProblem;
import Model.InputDomain;
import Model.Literal;
import Model.LiteralType;
import Model.NonDeterministicAction;
import Model.Parameter;
import Model.Problem;
import com.thoughtworks.xstream.mapper.Mapper;

public class Converter {

    public void Compile(InputDomain inDomain, InProblem inProblem, Domain outDomain, Problem outProblem, int K) {

        int b = DetermineBranchingFactor(inDomain);

        ////Marked as comment because initializes before the method called
        //outDomain = new Domain(outDomain.Name);               //todo: WHAT NAME SHOULD BE HERE?
        //outProblem = new Problem(outProblem.Name);    //todo: WHAT NAME SHOULD BE HERE?

        //--------- Create Domain ------------------//
        outDomain.ObjectTypes = ConvertTypes(inDomain);
        outDomain.Predicates = this.ConvertPredicates(inDomain);
        outDomain.Actions.addAll(CreateBaseActions(inDomain, K, b));
        outDomain.Actions.addAll(CreateCopyActions(inDomain, K, b));
        outDomain.Actions.addAll(CreateGoalachievedActions(inDomain, inProblem, K, b));

        //--------- Create Problem ----------------//
        outProblem.Objects = ConvertObjects(inProblem, K, b);
        outProblem.InitState = CreateInitState(inProblem, inDomain, K, b);
        outProblem.GoalState = CreateGoalState();

    }

    private int DetermineBranchingFactor(InputDomain inDomain) {

        int branchFactor = 1;
        for (Action act : inDomain.Actions) {
            if (act.getClass() == NonDeterministicAction.class) {
                if (((NonDeterministicAction) act).NonDetEffects.size() > branchFactor)
                    branchFactor = ((NonDeterministicAction) act).NonDetEffects.size();
            }
        }

        return branchFactor;
    }

    private ArrayList<String> ConvertTypes(InputDomain inDomain) {
        ArrayList<String> types = new ArrayList<String>();

        types.addAll(inDomain.ObjectTypes);
        types.add(SpecificPredicates.LevelType);

        return types;
    }

    private ArrayList<Literal> ConvertPredicates(InputDomain inDomain) {

        ArrayList<Literal> newPredicates = new ArrayList<Literal>();

        //Add all predicates that don't need to be "leveled"
        newPredicates.addAll(inDomain.NotDependedPredicates);

        // Create "leveled" Predicates
        for (Literal lit : inDomain.Predicates) {
            ArrayList<Parameter> newParams = new ArrayList<Parameter>();
            newParams.addAll(lit.Params);
            newParams.add(new Parameter(SpecificPredicates.ParLevel, true, SpecificPredicates.LevelType));

            newPredicates.add(new Literal(lit.Name, lit.Type, newParams));
        }

        // Add specific predicates
        //newPredicates.add(new Literal(SpecificPredicates.Current_level, LiteralType.Pos,
        //                new ArrayList<String>(){{ add(SpecificPredicates.ParLevel); }}));

        //newPredicates.add(new Literal(SpecificPredicates.Max_level, LiteralType.Pos,
        //                new ArrayList<String>(){{ add(SpecificPredicates.ParLevel); }}));

        newPredicates.addAll(GetAllNotInTransaction(inDomain));

        newPredicates.add(new Literal(SpecificPredicates.Closed, LiteralType.Pos,
                new ArrayList<Parameter>() {{
                    add(new Parameter(SpecificPredicates.ParLevel, true, SpecificPredicates.LevelType));
                }}));

        for (Action act : inDomain.Actions) {
            if (act.getClass() == NonDeterministicAction.class) {
                newPredicates.add(new Literal(SpecificPredicates.Next_level + act.Name, LiteralType.Pos,
                        new ArrayList<Parameter>() {{
                            add(new Parameter(SpecificPredicates.ParLevel + "1", true, SpecificPredicates.LevelType));
                            add(new Parameter(SpecificPredicates.ParLevel + "2", true, SpecificPredicates.LevelType));
                        }}));

                newPredicates.add(new Literal(SpecificPredicates.Copied_pos + act.Name, LiteralType.Pos,
                        new ArrayList<Parameter>() {{
                            add(new Parameter(SpecificPredicates.ParLevel, true, SpecificPredicates.LevelType));
                        }}));

                newPredicates.add(new Literal(SpecificPredicates.Copied_neg + act.Name, LiteralType.Pos,
                        new ArrayList<Parameter>() {{
                            add(new Parameter(SpecificPredicates.ParLevel, true, SpecificPredicates.LevelType));
                        }}));
            }
        }


        return newPredicates;
    }

    private ArrayList<Parameter> ConvertObjects(InProblem inProblem, int K, int B) {
        ArrayList<Parameter> newObjects = new ArrayList<Parameter>();

        //Copy existing
        newObjects.addAll(inProblem.Objects);

        //Add specific objects
        newObjects.add(new Parameter(SpecificPredicates.Level + "_0_0", true, SpecificPredicates.LevelType));
        for (int i = 1; i <= K; i++) {
            for (int j = 1; j < B; j++) {
                newObjects.add(new Parameter(SpecificPredicates.Level + "_" + i + "_" + j, true, SpecificPredicates.LevelType));
            }
        }

        return newObjects;
    }

    private ArrayList<Literal> CreateInitState(InProblem inProblem, InputDomain inDomain, int K, int B) {

        ArrayList<Literal> newInit = new ArrayList<Literal>();

        //Add all Not depended predicates as they are
        newInit.addAll(inProblem.InitNotDependedState);

        //Add level parameter to the depended predicates
        for (Literal initPredicate : inProblem.InitState) {
            ArrayList<Parameter> newParams = (ArrayList<Parameter>) initPredicate.Params.clone();
            newParams.add(new Parameter(SpecificPredicates.Level + "_0_0"));
            newInit.add(new Literal(initPredicate.Name, initPredicate.Type, newParams));
        }

        //Add specific initial predicates
        newInit.addAll(GetAllNotInTransaction(inDomain));

        //ArrayList<String> openParam = new ArrayList<String>();
        //openParam.add(SpecificPredicates.Level+"_0_0");
        //newInit.add(new Literal(SpecificPredicates.Closed, LiteralType.Neg, openParam));
        for (int i = 1; i <= K; i++) {
            for (int j = 1; j < B; j++) {
                ArrayList<Parameter> param = new ArrayList<Parameter>();
                param.add(new Parameter(SpecificPredicates.Level + "_" + i + "_" + j));
                newInit.add(new Literal(SpecificPredicates.Closed, LiteralType.Pos, param));
            }
        }

        //next levels from 0,0 level for all actions
        for (Action action : inDomain.Actions) {
            if (action.getClass() == NonDeterministicAction.class) {
                ArrayList<F_Effect> nonDetEffects = ((NonDeterministicAction) action).NonDetEffects;
                //Note: Skip the first (e0)
                for (int l = 1; l < nonDetEffects.size(); l++) {
                    int effectFVal = nonDetEffects.get(l).EffectFFunc;
                    if (effectFVal <= K) {
                        ArrayList<Parameter> param = new ArrayList<Parameter>();
                        param.add(new Parameter(SpecificPredicates.Level + "_0_0"));
                        param.add(new Parameter(SpecificPredicates.Level + "_" + effectFVal + "_" + l));
                        newInit.add(new Literal(SpecificPredicates.Next_level + action.Name, LiteralType.Pos, param));
                    }
                }

            }
        }

        //Next levels from all levels for all actions
        for (int i = 1; i <= K; i++) {
            for (int j = 1; j < B; j++) {
                for (Action action : inDomain.Actions) {
                    if (action.getClass() == NonDeterministicAction.class) {
                        ArrayList<F_Effect> nonDetEffects = ((NonDeterministicAction) action).NonDetEffects;
                        //Note: Skip the first (e0)
                        for (int l = 1; l < nonDetEffects.size(); l++) {
                            int effectFVal = nonDetEffects.get(l).EffectFFunc;
                            if (i + effectFVal <= K) {
                                ArrayList<Parameter> param = new ArrayList<Parameter>();
                                param.add(new Parameter(SpecificPredicates.Level + "_" + i + "_" + j));
                                param.add(new Parameter(SpecificPredicates.Level + "_" + (i + effectFVal) + "_" + l));
                                newInit.add(new Literal(SpecificPredicates.Next_level + action.Name, LiteralType.Pos, param));
                            }
                        }

                    }
                }
            }
        }

        return newInit;
    }

    private ArrayList<Literal> CreateGoalState() {
        ArrayList<Literal> newGoal = new ArrayList<Literal>();
        ArrayList<Parameter> param = new ArrayList<Parameter>();
        param.add(new Parameter(SpecificPredicates.Level + "_0_0"));
        newGoal.add(new Literal(SpecificPredicates.Closed, LiteralType.Pos, param));

        return newGoal;
    }

    private ArrayList<Action> CreateBaseActions(InputDomain inDomain, int k, int b) {
        ArrayList<Action> baseActions = new ArrayList<Action>();

        for (Action action : inDomain.Actions) {
            if (action.getClass() == NonDeterministicAction.class) {
                NonDeterministicAction nondetAction = (NonDeterministicAction)action;
                int[] originalFFunc = new int[nondetAction.NonDetEffects.size()];
                for (int effectIdx = 0; effectIdx < nondetAction.NonDetEffects.size(); effectIdx++){
                    F_Effect nondetEffect = nondetAction.NonDetEffects.get(effectIdx);
                    originalFFunc[effectIdx] = nondetEffect.EffectFFunc;
                    nondetEffect.EffectFFunc = 1;
                }
                for (F_Effect nondetEffect : nondetAction.NonDetEffects){
                    nondetEffect.EffectFFunc = 0;
                    baseActions.add(CreateBaseAction(action, inDomain, 0,0, k ,b));
                    nondetEffect.EffectFFunc = 1;
                }
                for (int effectIdx = 0; effectIdx < nondetAction.NonDetEffects.size(); effectIdx++){
                    nondetAction.NonDetEffects.get(effectIdx).EffectFFunc = originalFFunc[effectIdx];
                }

            }
            else {
                // Create 0_0 level for a deterministic action
                baseActions.add(CreateBaseAction(action, inDomain, 0, 0, k, b));
            }

            for (int i = 1; i <= k; i++) {
                for (int j = 1; j < b; j++) {
                    if (action.getClass() == NonDeterministicAction.class) {
                        NonDeterministicAction nondetAction = (NonDeterministicAction)action;
                        int[] originalFFunc = new int[nondetAction.NonDetEffects.size()];
                        for (int effectIdx = 0; effectIdx < nondetAction.NonDetEffects.size(); effectIdx++){
                            F_Effect nondetEffect = nondetAction.NonDetEffects.get(effectIdx);
                            originalFFunc[effectIdx] = nondetEffect.EffectFFunc;
                            nondetEffect.EffectFFunc = 1;
                        }
                        for (F_Effect nondetEffect : nondetAction.NonDetEffects){
                            nondetEffect.EffectFFunc = 0;
                            baseActions.add(CreateBaseAction(action, inDomain, i,j, k ,b));
                            nondetEffect.EffectFFunc = 1;
                        }
                        for (int effectIdx = 0; effectIdx < nondetAction.NonDetEffects.size(); effectIdx++){
                            nondetAction.NonDetEffects.get(effectIdx).EffectFFunc = originalFFunc[effectIdx];
                        }

                    }
                    else {
                        // deterministic action
                        baseActions.add(CreateBaseAction(action, inDomain, 0, 0, k, b));
                    }
                }
            }
        }

        return baseActions;
    }

    private Action CreateBaseAction(Action action, InputDomain inDomain, int i, int j, int k, int b) {
        if (action.getClass() == NonDeterministicAction.class) {
            NonDeterministicAction nondetAction = (NonDeterministicAction)action;
            for (F_Effect nondetEffect : nondetAction.NonDetEffects){
                if (nondetEffect.EffectFFunc == 0){
                    return CreateBaseAction(action, inDomain, i, j, k, b, nondetEffect.Name);
                }
            }
            /* Couldn't find a primary effect for this action */
            throw new IllegalArgumentException("Nondet action" + action.Name + " has no primary effect");
        }
        else{
            return CreateBaseAction(action, inDomain, i, j, k, b, "");
        }

    }

    private Action CreateBaseAction(Action action, InputDomain inDomain, int i, int j, int k, int b, String pEffect) {
        Action newAct = new Action(action.Name + "_" + i + "_" + j + "_" + pEffect);
        //Parameters
        newAct.Params.addAll(action.Params);
        //Preconditions
        if (action.getClass() == NonDeterministicAction.class) {
            newAct.PreConditions.add(new Literal(SpecificPredicates.Not_in_Transaction + action.Name, LiteralType.Neg)); // is in relevant actions transaction
            ArrayList<Parameter> copiedParams = new ArrayList<Parameter>();
            copiedParams.add(new Parameter(SpecificPredicates.Level + "_" + i + "_" + j));
            newAct.PreConditions.add(new Literal(SpecificPredicates.Copied_pos + action.Name, LiteralType.Pos, copiedParams));
            newAct.PreConditions.add(new Literal(SpecificPredicates.Copied_neg + action.Name, LiteralType.Pos, copiedParams));
        }
        newAct.PreConditions.addAll(GetAllNotInTransaction(inDomain, action));  // not in all the rest of actions
        //Current level not closed yet
        ArrayList<Parameter> notClosedParams = new ArrayList<Parameter>();
        notClosedParams.add(new Parameter(SpecificPredicates.Level + "_" + i + "_" + j));
        newAct.PreConditions.add(new Literal(SpecificPredicates.Closed, LiteralType.Neg, notClosedParams));
        //All "above" branches of same level are closed
        if (i > 0) {
            for (int l = j + 1; l < b; l++) {
                ArrayList<Parameter> ClosedParams = new ArrayList<Parameter>();
                ClosedParams.add(new Parameter(SpecificPredicates.Level + "_" + i + "_" + l));
                newAct.PreConditions.add(new Literal(SpecificPredicates.Closed, LiteralType.Pos, ClosedParams));
            }
        }
        //All "above" levels are closed
        for (int l = i + 1; l <= k; l++) {
            for (int l2 = 1; l2 < b; l2++) {
                ArrayList<Parameter> ClosedParams = new ArrayList<Parameter>();
                ClosedParams.add(new Parameter(SpecificPredicates.Level + "_" + l + "_" + l2));
                newAct.PreConditions.add(new Literal(SpecificPredicates.Closed, LiteralType.Pos, ClosedParams));
            }
        }

        //Original preconditions
        for (Literal preCon : action.PreConditions) {
            Literal newPre = preCon.Clone();
            //Add level to the depended predicates
            if (IsDependedPredicate(inDomain, preCon))
                newPre.Params.add(new Parameter(SpecificPredicates.Level + "_" + i + "_" + j));
            newAct.PreConditions.add(newPre);
        }

        //Effects
        //Base effects
        for (Effect eff : action.Effects) {
            Effect newEff = new Effect(eff.Name);
            for (Literal literal : eff.AddedLiterals) {
                Literal newLit = literal.Clone();
                newLit.Params.add(new Parameter(SpecificPredicates.Level + "_" + i + "_" + j));
                newEff.AddedLiterals.add(newLit);
            }
            for (Literal literal : eff.DeletedLiterals) {
                Literal newLit = literal.Clone();
                newLit.Params.add(new Parameter(SpecificPredicates.Level + "_" + i + "_" + j));
                newEff.DeletedLiterals.add(newLit);
            }
            newAct.Effects.add(newEff);
        }
        //Non Deterministic effects
        if (action.getClass() == NonDeterministicAction.class) {
            int bCount = 0;

            for (F_Effect nonDetEff : ((NonDeterministicAction) action).NonDetEffects) {
                Effect newNonDetEff = new Effect();
                if (nonDetEff.EffectFFunc == 0) {
                //if (bCount == 0) {
                    for (Literal lit : nonDetEff.AddedLiterals) {
                        Literal copiedLit = lit.Clone();
                        copiedLit.Params.add(new Parameter(SpecificPredicates.Level + "_" + i + "_" + j));
                        newNonDetEff.AddedLiterals.add(copiedLit);
                    }

                    for (Literal lit : nonDetEff.DeletedLiterals) {
                        Literal copiedLit = lit.Clone();
                        copiedLit.Params.add(new Parameter(SpecificPredicates.Level + "_" + i + "_" + j));
                        newNonDetEff.DeletedLiterals.add(copiedLit);
                    }
                } else {
                    if ((i + nonDetEff.EffectFFunc) <= k) {    // check if  legal for copy
                        ArrayList<Parameter> closedLevel = new ArrayList<Parameter>();
                        closedLevel.add(new Parameter(SpecificPredicates.Level + "_" + (i + nonDetEff.EffectFFunc) + "_" + bCount));
                        Literal closedLit = new Literal(SpecificPredicates.Closed, LiteralType.Neg, closedLevel);
                        newNonDetEff.AddedLiterals.add(closedLit);


                        for (Literal lit : nonDetEff.AddedLiterals) {
                            Literal copiedLit = lit.Clone();
                            copiedLit.Params.add(new Parameter(SpecificPredicates.Level + "_" + (i + nonDetEff.EffectFFunc) + "_" + bCount));
                            newNonDetEff.AddedLiterals.add(copiedLit);
                        }

                        for (Literal lit : nonDetEff.DeletedLiterals) {
                            Literal copiedLit = lit.Clone();
                            copiedLit.Params.add(new Parameter(SpecificPredicates.Level + "_" + (i + nonDetEff.EffectFFunc) + "_" + bCount));
                            newNonDetEff.DeletedLiterals.add(copiedLit);
                        }
                    }
                }

                bCount++;
                // Note: copy only if actual data (avoid empty e0, for instance)
                if (newNonDetEff.AddedLiterals.size() > 0 || newNonDetEff.DeletedLiterals.size() > 0)
                    newAct.Effects.add(newNonDetEff);

            }

            //Not-in-transaction predicate
            Effect notInTranEff = new Effect();
            notInTranEff.AddedLiterals.add(new Literal(SpecificPredicates.Not_in_Transaction + action.Name));
            newAct.Effects.add(notInTranEff);

            //Copied predicates
            ArrayList<Parameter> levelParam = new ArrayList<Parameter>();
            levelParam.add(new Parameter(SpecificPredicates.Level + "_" + i + "_" + j));

            Effect copiedPosEff = new Effect();
            copiedPosEff.AddedLiterals.add(new Literal(SpecificPredicates.Copied_pos + action.Name, LiteralType.Neg, levelParam));
            newAct.Effects.add(copiedPosEff);

            Effect copiedNegEff = new Effect();
            copiedNegEff.AddedLiterals.add(new Literal(SpecificPredicates.Copied_neg + action.Name, LiteralType.Neg, levelParam));
            newAct.Effects.add(copiedNegEff);

        }

        return newAct;
    }

    private ArrayList<Action> CreateCopyActions(InputDomain inDomain, int k, int b) {
        ArrayList<Action> copyActions = new ArrayList<Action>();
        for (Action action : inDomain.Actions) {
            if (action.getClass() == NonDeterministicAction.class) {
                copyActions.add(CreateCopyAction(LiteralType.Pos, inDomain, action));
                copyActions.add(CreateCopyAction(LiteralType.Neg, inDomain, action));
            }

        }
        return copyActions;
    }

    private Action CreateCopyAction(LiteralType type, InputDomain inDomain, Action origAction) {
        Action copyAction = new Action(SpecificActions.copy_substate_ + type.toString().toLowerCase() + "_" + origAction.Name);

        // ----- Action Parameters ------------------------------------
        copyAction.Params.add(new Parameter(SpecificPredicates.ParLevel, true, SpecificPredicates.LevelType));
        // ----- Action Parameters ------------------------------------

        // -------Action Preconditions -------------------------------
        //Not In Transaction
        copyAction.PreConditions.addAll(GetAllNotInTransaction(inDomain, origAction));
        Literal notInTran = new Literal(SpecificPredicates.Not_in_Transaction + origAction.Name);
        notInTran.Type = type; // same as the method parameter
        copyAction.PreConditions.add(notInTran);
        //Not closed
        ArrayList<Parameter> notClosedParams = new ArrayList<Parameter>();
        notClosedParams.add(new Parameter(SpecificPredicates.ParLevel));
        Literal notClosed = new Literal(SpecificPredicates.Closed, LiteralType.Neg, notClosedParams);
        copyAction.PreConditions.add(notClosed);
        //Copied Pos
        ArrayList<Parameter> copiedPosParams = new ArrayList<Parameter>();
        copiedPosParams.add(new Parameter(SpecificPredicates.ParLevel));
        Literal copiedPos = new Literal(SpecificPredicates.Copied_pos + origAction.Name, LiteralType.Pos, copiedPosParams);
        if (type == LiteralType.Pos)
            copiedPos.Type = LiteralType.Neg;
        copyAction.PreConditions.add(copiedPos);
        //Copied Neg
        if (type == LiteralType.Neg) {
            ArrayList<String> copiedNegParams = new ArrayList<String>();
            copiedNegParams.add(SpecificPredicates.ParLevel);
            Literal copiedNeg = new Literal(SpecificPredicates.Copied_neg + origAction.Name, LiteralType.Neg, copiedPosParams);
            copyAction.PreConditions.add(copiedNeg);
        }
        // -------Action Preconditions -------------------------------

        //-------- Action Effects ---------------------------

        //Spreading to next levels
        for (Literal predicate : inDomain.Predicates) {
            //Multi Parameters
            ConditionalEffect newEff = new ConditionalEffect();
            newEff.EffType = EffectType.Multi;
            newEff.MultiParams.addAll(predicate.Params);
            newEff.MultiParams.add(new Parameter(SpecificPredicates.ParNextLevel, true, SpecificPredicates.LevelType));

            //Conditions
            Literal newLit = new Literal(predicate.Name, type);
            for (Parameter param : predicate.Params) {
                newLit.Params.add(new Parameter(param.Name));
            }
            newLit.Params.add(new Parameter(SpecificPredicates.ParLevel));
            newEff.Conditions.add(newLit);
            //next level condition
            newLit = new Literal(SpecificPredicates.Next_level + origAction.Name);
            newLit.Params.add(new Parameter(SpecificPredicates.ParLevel));
            newLit.Params.add(new Parameter(SpecificPredicates.ParNextLevel));
            newEff.Conditions.add(newLit);

            //Effect
            newLit = new Literal(predicate.Name, type);
            for (Parameter param : predicate.Params) {
                newLit.Params.add(new Parameter(param.Name));
            }
            newLit.Params.add(new Parameter(SpecificPredicates.ParNextLevel));
            newEff.AddedLiterals.add(newLit);

            //Add the new effect
            copyAction.Effects.add(newEff);
        }
        //Specific effects
        if (type == LiteralType.Pos) {
            ArrayList<Parameter> copiedPosPar = new ArrayList<Parameter>();
            copiedPosPar.add(new Parameter(SpecificPredicates.ParLevel));
            Literal copiedPoslit = new Literal(SpecificPredicates.Copied_pos + origAction.Name, LiteralType.Pos, copiedPosPar);
            Effect copiedPosEff = new Effect();
            copiedPosEff.AddedLiterals.add(copiedPoslit);
            copyAction.Effects.add(copiedPosEff);

            Literal notInTranlit = new Literal(SpecificPredicates.Not_in_Transaction + origAction.Name);
            notInTranlit.Type = LiteralType.Neg;
            Effect notInTranEff = new Effect();
            notInTranEff.AddedLiterals.add(notInTranlit);
            copyAction.Effects.add(notInTranEff);
        } else {
            ArrayList<Parameter> copiedNegPar = new ArrayList<Parameter>();
            copiedNegPar.add(new Parameter(SpecificPredicates.ParLevel));
            Literal copiedNeglit = new Literal(SpecificPredicates.Copied_neg + origAction.Name, LiteralType.Pos, copiedNegPar);
            Effect copiedNegEff = new Effect();
            copiedNegEff.AddedLiterals.add(copiedNeglit);
            copyAction.Effects.add(copiedNegEff);
        }

        //-------- Action Effects ---------------------------

        return copyAction;
    }

    private ArrayList<Action> CreateGoalachievedActions(InputDomain inDomain, InProblem inProblem, int k, int b) {

        ArrayList<Action> goalAchActions = new ArrayList<Action>();
        //add Goal achiever for 0,0 level
        goalAchActions.add(CreateGoalAchiever(inDomain, inProblem, 0, 0, k, b));
        for (int i = 1; i <= k; i++) {
            for (int j = 1; j < b; j++) {
                //Add action to Achieved actions
                goalAchActions.add(CreateGoalAchiever(inDomain, inProblem, i, j, k, b));
            }
        }

        return goalAchActions;
    }

    private Action CreateGoalAchiever(InputDomain inDomain, InProblem inProblem, int i, int j, int k, int b) {
        Action newAct = new Action(SpecificActions.goal_achieved_level + "_" + i + "_" + j);
        //Add preconditions
        newAct.PreConditions.addAll(GetAllNotInTransaction(inDomain));
        ArrayList<Parameter> params = new ArrayList<Parameter>();
        params.add(new Parameter(SpecificPredicates.Level + "_" + i + "_" + j));
        Literal notClosed = new Literal(SpecificPredicates.Closed, LiteralType.Neg, params);
        newAct.PreConditions.add(notClosed);

        //All "above" branches of current level are closed
        if (i > 0) {
            for (int l = j + 1; l < b; l++) {
                params = new ArrayList<Parameter>();
                params.add(new Parameter(SpecificPredicates.Level + "_" + i + "_" + l));
                Literal closed = new Literal(SpecificPredicates.Closed, LiteralType.Pos, params);
                newAct.PreConditions.add(closed);
            }
        }

        //All "above" levels are closed
        for (int l = i + 1; l <= k; l++) {
            for (int l2 = 1; l2 < b; l2++) {
                params = new ArrayList<Parameter>();
                params.add(new Parameter(SpecificPredicates.Level + "_" + l + "_" + l2));
                Literal closed = new Literal(SpecificPredicates.Closed, LiteralType.Pos, params);
                newAct.PreConditions.add(closed);
            }
        }

        //Add Goal "leveled" predicates
        for (Literal goalLit : inProblem.GoalState) {
            ArrayList<Parameter> litParams = (ArrayList<Parameter>) goalLit.Params.clone();
            litParams.add(new Parameter(SpecificPredicates.Level + "_" + i + "_" + j));
            Literal newLit = new Literal(goalLit.Name, goalLit.Type, litParams);
            newAct.PreConditions.add(newLit);
        }

        //Add effect
        params = new ArrayList<Parameter>();
        params.add(new Parameter(SpecificPredicates.Level + "_" + i + "_" + j));
        Literal newLiteral = new Literal(SpecificPredicates.Closed, LiteralType.Pos, params);
        ArrayList<Literal> adds = new ArrayList<Literal>();
        adds.add(newLiteral);
        Effect newEffect = new Effect();
        newEffect.AddedLiterals = adds;
        newAct.Effects.add(newEffect);

        return newAct;
    }

    private ArrayList<Literal> GetAllNotInTransaction(InputDomain inDomain, Action exceptAction) {
        ArrayList<Literal> notInTranLiterals = new ArrayList<Literal>();

        for (Action act : inDomain.Actions) {
            if (act.getClass() == NonDeterministicAction.class) {
                if (exceptAction != null && exceptAction.Name == act.Name)
                    continue;
                notInTranLiterals.add(new Literal(SpecificPredicates.Not_in_Transaction + act.Name));
            }
        }

        return notInTranLiterals;
    }

    private ArrayList<Literal> GetAllNotInTransaction(InputDomain inDomain) {
        return GetAllNotInTransaction(inDomain, null);
    }

    private Boolean IsDependedPredicate(InputDomain inDomain, Literal predicate) {
        for (Literal domPredicates : inDomain.Predicates) {
            if (domPredicates.Name == predicate.Name)
                return true;
        }
        return false;
    }
}