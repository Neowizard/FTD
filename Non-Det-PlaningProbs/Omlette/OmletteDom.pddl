(define (domain Omlette)
	(:types bowl number levelType)
	(:predicates
		(sum ?no1 - number ?no2 - number ?no3 - number)
		(add-one ?no1 - number ?no2 - number)
		(unspoiled ?x - bowl ?level - levelType)
		(holding ?level - levelType)
		(has ?bowl - bowl ?no-of-eggs - number ?level - levelType)
		(not-in-break-in)
		(closed ?level - levelType)
		(next-level-of-break-in ?level1 - levelType ?level2 - levelType)
		(copied-pos-break-in ?level - levelType)
		(copied-neg-break-in ?level - levelType)
	)

	(:action grab_0_0
	:parameters  ()
	:precondition 
		(and
		(not-in-break-in)
		(not (closed level_0_0))
		(closed level_1_1)
		(not (holding level_0_0))
		)
	:effect 
		 
		(holding level_0_0) 
 
	)

	(:action grab_1_1
	:parameters  ()
	:precondition 
		(and
		(not-in-break-in)
		(not (closed level_1_1))
		(not (holding level_1_1))
		)
	:effect 
		 
		(holding level_1_1) 
 
	)

	(:action break-in_0_0
	:parameters  ( ?bowl - bowl ?eggs-before - number ?eggs-after - number)
	:precondition 
		(and
		(not (not-in-break-in))
		(copied-pos-break-in level_0_0)
		(copied-neg-break-in level_0_0)
		(not (closed level_0_0))
		(closed level_1_1)
		(holding level_0_0)
		(has ?bowl ?eggs-before level_0_0)
		(add-one ?eggs-before ?eggs-after)
		)
	:effect 
		(and
		(and (has ?bowl ?eggs-after level_0_0) (not (has ?bowl ?eggs-before level_0_0)) (not (holding level_0_0)) )
		(and (not (closed level_1_1)) (not (unspoiled ?bowl level_1_1)) )
		(not-in-break-in) 
		(not (copied-pos-break-in level_0_0)) 
		(not (copied-neg-break-in level_0_0)) 
		)
	)

	(:action break-in_1_1
	:parameters  ( ?bowl - bowl ?eggs-before - number ?eggs-after - number)
	:precondition 
		(and
		(not (not-in-break-in))
		(copied-pos-break-in level_1_1)
		(copied-neg-break-in level_1_1)
		(not (closed level_1_1))
		(holding level_1_1)
		(has ?bowl ?eggs-before level_1_1)
		(add-one ?eggs-before ?eggs-after)
		)
	:effect 
		(and
		(and (has ?bowl ?eggs-after level_1_1) (not (has ?bowl ?eggs-before level_1_1)) (not (holding level_1_1)) )
		(not-in-break-in) 
		(not (copied-pos-break-in level_1_1)) 
		(not (copied-neg-break-in level_1_1)) 
		)
	)

	(:action clean_0_0
	:parameters  ( ?bowl - bowl ?no-of-eggs - number)
	:precondition 
		(and
		(not-in-break-in)
		(not (closed level_0_0))
		(closed level_1_1)
		(not (holding level_0_0))
		(has ?bowl ?no-of-eggs level_0_0)
		)
	:effect 
		 
		(and (has ?bowl n0 level_0_0) (unspoiled ?bowl level_0_0) (not (has ?bowl ?no-of-eggs level_0_0)) )
 
	)

	(:action clean_1_1
	:parameters  ( ?bowl - bowl ?no-of-eggs - number)
	:precondition 
		(and
		(not-in-break-in)
		(not (closed level_1_1))
		(not (holding level_1_1))
		(has ?bowl ?no-of-eggs level_1_1)
		)
	:effect 
		 
		(and (has ?bowl n0 level_1_1) (unspoiled ?bowl level_1_1) (not (has ?bowl ?no-of-eggs level_1_1)) )
 
	)

	(:action pour_0_0
	:parameters  ( ?bowl1 - bowl ?bowl2 - bowl ?no1 - number ?no2 - number ?no3 - number)
	:precondition 
		(and
		(not-in-break-in)
		(not (closed level_0_0))
		(closed level_1_1)
		(not (holding level_0_0))
		(has ?bowl1 ?no1 level_0_0)
		(has ?bowl2 ?no2 level_0_0)
		(sum ?no1 ?no2 ?no3)
		(not (= ?bowl1 ?bowl2))
		)
	:effect 
		 
		(and (has ?bowl1 n0 level_0_0) (has ?bowl2 ?no3 level_0_0) (unspoiled ?bowl1 level_0_0) (not (has ?bowl1 ?no1 level_0_0)) (not (has ?bowl2 ?no2 level_0_0)) )
 
	)

	(:action pour_1_1
	:parameters  ( ?bowl1 - bowl ?bowl2 - bowl ?no1 - number ?no2 - number ?no3 - number)
	:precondition 
		(and
		(not-in-break-in)
		(not (closed level_1_1))
		(not (holding level_1_1))
		(has ?bowl1 ?no1 level_1_1)
		(has ?bowl2 ?no2 level_1_1)
		(sum ?no1 ?no2 ?no3)
		(not (= ?bowl1 ?bowl2))
		)
	:effect 
		 
		(and (has ?bowl1 n0 level_1_1) (has ?bowl2 ?no3 level_1_1) (unspoiled ?bowl1 level_1_1) (not (has ?bowl1 ?no1 level_1_1)) (not (has ?bowl2 ?no2 level_1_1)) )
 
	)

	(:action copy_substate_pos_break-in
	:parameters  ( ?level - levelType)
	:precondition 
		(and
		(not-in-break-in)
		(not (closed ?level))
		(not (copied-pos-break-in ?level))
		)
	:effect 
		(and
		( forall ( ?x - bowl ?nlevel - levelType)
			(when (and (unspoiled ?x ?level) (next-level-of-break-in ?level ?nlevel) ) (unspoiled ?x ?nlevel) ))
		( forall ( ?nlevel - levelType)
			(when (and (holding ?level) (next-level-of-break-in ?level ?nlevel) ) (holding ?nlevel) ))
		( forall ( ?bowl - bowl ?no-of-eggs - number ?nlevel - levelType)
			(when (and (has ?bowl ?no-of-eggs ?level) (next-level-of-break-in ?level ?nlevel) ) (has ?bowl ?no-of-eggs ?nlevel) ))
		(copied-pos-break-in ?level) 
		(not (not-in-break-in)) 
		)
	)

	(:action copy_substate_neg_break-in
	:parameters  ( ?level - levelType)
	:precondition 
		(and
		(not (not-in-break-in))
		(not (closed ?level))
		(copied-pos-break-in ?level)
		(not (copied-neg-break-in ?level))
		)
	:effect 
		(and
		( forall ( ?x - bowl ?nlevel - levelType)
			(when (and (not (unspoiled ?x ?level)) (next-level-of-break-in ?level ?nlevel) ) (not (unspoiled ?x ?nlevel)) ))
		( forall ( ?nlevel - levelType)
			(when (and (not (holding ?level)) (next-level-of-break-in ?level ?nlevel) ) (not (holding ?nlevel)) ))
		( forall ( ?bowl - bowl ?no-of-eggs - number ?nlevel - levelType)
			(when (and (not (has ?bowl ?no-of-eggs ?level)) (next-level-of-break-in ?level ?nlevel) ) (not (has ?bowl ?no-of-eggs ?nlevel)) ))
		(copied-neg-break-in ?level) 
		)
	)

	(:action goal_achieved_level_0_0
	:parameters  ()
	:precondition 
		(and
		(not-in-break-in)
		(not (closed level_0_0))
		(closed level_1_1)
		(has bowl2 n3 level_0_0)
		(unspoiled bowl2 level_0_0)
		)
	:effect 
		 
		(closed level_0_0) 
 
	)

	(:action goal_achieved_level_1_1
	:parameters  ()
	:precondition 
		(and
		(not-in-break-in)
		(not (closed level_1_1))
		(has bowl2 n3 level_1_1)
		(unspoiled bowl2 level_1_1)
		)
	:effect 
		 
		(closed level_1_1) 
 
	)
)