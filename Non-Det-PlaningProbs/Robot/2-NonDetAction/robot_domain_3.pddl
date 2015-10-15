(define (domain Robot)
	(:types robot location number levelType)
	(:predicates
		(safe-path ?x1 - location ?x2 - location)
		(not-safe-path ?x1 - location ?x2 - location)
		(sum ?no1 - number ?no2 - number ?no3 - number)
		(use-one ?no1 - number ?no2 - number)
		(has-spare ?x - location ?num - number ?level - levelType)
		(spare-tiers ?robot - robot ?num - number ?level - levelType)
		(robot-at ?robot - robot ?x - location ?level - levelType)
		(flat ?level - levelType)
		(not-in-unsafe-move)
		(closed ?level - levelType)
		(next-level-of-unsafe-move ?level1 - levelType ?level2 - levelType)
		(copied-pos-unsafe-move ?level - levelType)
		(copied-neg-unsafe-move ?level - levelType)
	)

	(:action safe-move_0_0
	:parameters  ( ?robot - robot ?x1 - location ?x2 - location)
	:precondition 
		(and
		(not-in-unsafe-move)
		(not (closed level_0_0))
		(closed level_1_1)
		(closed level_1_2)
		(closed level_2_1)
		(closed level_2_2)
		(not (flat level_0_0))
		(robot-at ?robot ?x1 level_0_0)
		(safe-path ?x1 ?x2)
		)
	:effect 
		 
		(and (robot-at ?robot ?x2 level_0_0) (not (robot-at ?robot ?x1 level_0_0)) )
 
	)

	(:action safe-move_1_1
	:parameters  ( ?robot - robot ?x1 - location ?x2 - location)
	:precondition 
		(and
		(not-in-unsafe-move)
		(not (closed level_1_1))
		(closed level_1_2)
		(closed level_2_1)
		(closed level_2_2)
		(not (flat level_1_1))
		(robot-at ?robot ?x1 level_1_1)
		(safe-path ?x1 ?x2)
		)
	:effect 
		 
		(and (robot-at ?robot ?x2 level_1_1) (not (robot-at ?robot ?x1 level_1_1)) )
 
	)

	(:action safe-move_1_2
	:parameters  ( ?robot - robot ?x1 - location ?x2 - location)
	:precondition 
		(and
		(not-in-unsafe-move)
		(not (closed level_1_2))
		(closed level_2_1)
		(closed level_2_2)
		(not (flat level_1_2))
		(robot-at ?robot ?x1 level_1_2)
		(safe-path ?x1 ?x2)
		)
	:effect 
		 
		(and (robot-at ?robot ?x2 level_1_2) (not (robot-at ?robot ?x1 level_1_2)) )
 
	)

	(:action safe-move_2_1
	:parameters  ( ?robot - robot ?x1 - location ?x2 - location)
	:precondition 
		(and
		(not-in-unsafe-move)
		(not (closed level_2_1))
		(closed level_2_2)
		(not (flat level_2_1))
		(robot-at ?robot ?x1 level_2_1)
		(safe-path ?x1 ?x2)
		)
	:effect 
		 
		(and (robot-at ?robot ?x2 level_2_1) (not (robot-at ?robot ?x1 level_2_1)) )
 
	)

	(:action safe-move_2_2
	:parameters  ( ?robot - robot ?x1 - location ?x2 - location)
	:precondition 
		(and
		(not-in-unsafe-move)
		(not (closed level_2_2))
		(not (flat level_2_2))
		(robot-at ?robot ?x1 level_2_2)
		(safe-path ?x1 ?x2)
		)
	:effect 
		 
		(and (robot-at ?robot ?x2 level_2_2) (not (robot-at ?robot ?x1 level_2_2)) )
 
	)

	(:action unsafe-move_0_0
	:parameters  ( ?robot - robot ?x1 - location ?x2 - location)
	:precondition 
		(and
		(not (not-in-unsafe-move))
		(copied-pos-unsafe-move level_0_0)
		(copied-neg-unsafe-move level_0_0)
		(not (closed level_0_0))
		(closed level_1_1)
		(closed level_1_2)
		(closed level_2_1)
		(closed level_2_2)
		(not (flat level_0_0))
		(robot-at ?robot ?x1 level_0_0)
		(not-safe-path ?x1 ?x2)
		)
	:effect 
		(and
		(and (robot-at ?robot ?x2 level_0_0) (not (robot-at ?robot ?x1 level_0_0)) )
		(and (not (closed level_1_1)) (robot-at ?robot ?x2 level_1_1) (flat level_1_1) (not (robot-at ?robot ?x1 level_1_1)) )
		(and (not (closed level_1_2)) (flat level_1_2) )
		(not-in-unsafe-move) 
		(not (copied-pos-unsafe-move level_0_0)) 
		(not (copied-neg-unsafe-move level_0_0)) 
		)
	)

	(:action unsafe-move_1_1
	:parameters  ( ?robot - robot ?x1 - location ?x2 - location)
	:precondition 
		(and
		(not (not-in-unsafe-move))
		(copied-pos-unsafe-move level_1_1)
		(copied-neg-unsafe-move level_1_1)
		(not (closed level_1_1))
		(closed level_1_2)
		(closed level_2_1)
		(closed level_2_2)
		(not (flat level_1_1))
		(robot-at ?robot ?x1 level_1_1)
		(not-safe-path ?x1 ?x2)
		)
	:effect 
		(and
		(and (robot-at ?robot ?x2 level_1_1) (not (robot-at ?robot ?x1 level_1_1)) )
		(and (not (closed level_2_1)) (robot-at ?robot ?x2 level_2_1) (flat level_2_1) (not (robot-at ?robot ?x1 level_2_1)) )
		(and (not (closed level_2_2)) (flat level_2_2) )
		(not-in-unsafe-move) 
		(not (copied-pos-unsafe-move level_1_1)) 
		(not (copied-neg-unsafe-move level_1_1)) 
		)
	)

	(:action unsafe-move_1_2
	:parameters  ( ?robot - robot ?x1 - location ?x2 - location)
	:precondition 
		(and
		(not (not-in-unsafe-move))
		(copied-pos-unsafe-move level_1_2)
		(copied-neg-unsafe-move level_1_2)
		(not (closed level_1_2))
		(closed level_2_1)
		(closed level_2_2)
		(not (flat level_1_2))
		(robot-at ?robot ?x1 level_1_2)
		(not-safe-path ?x1 ?x2)
		)
	:effect 
		(and
		(and (robot-at ?robot ?x2 level_1_2) (not (robot-at ?robot ?x1 level_1_2)) )
		(and (not (closed level_2_1)) (robot-at ?robot ?x2 level_2_1) (flat level_2_1) (not (robot-at ?robot ?x1 level_2_1)) )
		(and (not (closed level_2_2)) (flat level_2_2) )
		(not-in-unsafe-move) 
		(not (copied-pos-unsafe-move level_1_2)) 
		(not (copied-neg-unsafe-move level_1_2)) 
		)
	)

	(:action unsafe-move_2_1
	:parameters  ( ?robot - robot ?x1 - location ?x2 - location)
	:precondition 
		(and
		(not (not-in-unsafe-move))
		(copied-pos-unsafe-move level_2_1)
		(copied-neg-unsafe-move level_2_1)
		(not (closed level_2_1))
		(closed level_2_2)
		(not (flat level_2_1))
		(robot-at ?robot ?x1 level_2_1)
		(not-safe-path ?x1 ?x2)
		)
	:effect 
		(and
		(and (robot-at ?robot ?x2 level_2_1) (not (robot-at ?robot ?x1 level_2_1)) )
		(not-in-unsafe-move) 
		(not (copied-pos-unsafe-move level_2_1)) 
		(not (copied-neg-unsafe-move level_2_1)) 
		)
	)

	(:action unsafe-move_2_2
	:parameters  ( ?robot - robot ?x1 - location ?x2 - location)
	:precondition 
		(and
		(not (not-in-unsafe-move))
		(copied-pos-unsafe-move level_2_2)
		(copied-neg-unsafe-move level_2_2)
		(not (closed level_2_2))
		(not (flat level_2_2))
		(robot-at ?robot ?x1 level_2_2)
		(not-safe-path ?x1 ?x2)
		)
	:effect 
		(and
		(and (robot-at ?robot ?x2 level_2_2) (not (robot-at ?robot ?x1 level_2_2)) )
		(not-in-unsafe-move) 
		(not (copied-pos-unsafe-move level_2_2)) 
		(not (copied-neg-unsafe-move level_2_2)) 
		)
	)

	(:action pick-spare_0_0
	:parameters  ( ?robot - robot ?x - location ?no-spare-x - number ?no-spare-robot - number ?no-total-spare - number)
	:precondition 
		(and
		(not-in-unsafe-move)
		(not (closed level_0_0))
		(closed level_1_1)
		(closed level_1_2)
		(closed level_2_1)
		(closed level_2_2)
		(has-spare ?x ?no-spare-x level_0_0)
		(spare-tiers ?robot ?no-spare-robot level_0_0)
		(robot-at ?robot ?x level_0_0)
		(sum ?no-spare-x ?no-spare-robot ?no-total-spare)
		)
	:effect 
		 
		(and (spare-tiers ?robot ?no-total-spare level_0_0) (has-spare ?x n0 level_0_0) (not (has-spare ?x ?no-spare-x level_0_0)) (not (spare-tiers ?robot ?no-spare-robot level_0_0)) )
 
	)

	(:action pick-spare_1_1
	:parameters  ( ?robot - robot ?x - location ?no-spare-x - number ?no-spare-robot - number ?no-total-spare - number)
	:precondition 
		(and
		(not-in-unsafe-move)
		(not (closed level_1_1))
		(closed level_1_2)
		(closed level_2_1)
		(closed level_2_2)
		(has-spare ?x ?no-spare-x level_1_1)
		(spare-tiers ?robot ?no-spare-robot level_1_1)
		(robot-at ?robot ?x level_1_1)
		(sum ?no-spare-x ?no-spare-robot ?no-total-spare)
		)
	:effect 
		 
		(and (spare-tiers ?robot ?no-total-spare level_1_1) (has-spare ?x n0 level_1_1) (not (has-spare ?x ?no-spare-x level_1_1)) (not (spare-tiers ?robot ?no-spare-robot level_1_1)) )
 
	)

	(:action pick-spare_1_2
	:parameters  ( ?robot - robot ?x - location ?no-spare-x - number ?no-spare-robot - number ?no-total-spare - number)
	:precondition 
		(and
		(not-in-unsafe-move)
		(not (closed level_1_2))
		(closed level_2_1)
		(closed level_2_2)
		(has-spare ?x ?no-spare-x level_1_2)
		(spare-tiers ?robot ?no-spare-robot level_1_2)
		(robot-at ?robot ?x level_1_2)
		(sum ?no-spare-x ?no-spare-robot ?no-total-spare)
		)
	:effect 
		 
		(and (spare-tiers ?robot ?no-total-spare level_1_2) (has-spare ?x n0 level_1_2) (not (has-spare ?x ?no-spare-x level_1_2)) (not (spare-tiers ?robot ?no-spare-robot level_1_2)) )
 
	)

	(:action pick-spare_2_1
	:parameters  ( ?robot - robot ?x - location ?no-spare-x - number ?no-spare-robot - number ?no-total-spare - number)
	:precondition 
		(and
		(not-in-unsafe-move)
		(not (closed level_2_1))
		(closed level_2_2)
		(has-spare ?x ?no-spare-x level_2_1)
		(spare-tiers ?robot ?no-spare-robot level_2_1)
		(robot-at ?robot ?x level_2_1)
		(sum ?no-spare-x ?no-spare-robot ?no-total-spare)
		)
	:effect 
		 
		(and (spare-tiers ?robot ?no-total-spare level_2_1) (has-spare ?x n0 level_2_1) (not (has-spare ?x ?no-spare-x level_2_1)) (not (spare-tiers ?robot ?no-spare-robot level_2_1)) )
 
	)

	(:action pick-spare_2_2
	:parameters  ( ?robot - robot ?x - location ?no-spare-x - number ?no-spare-robot - number ?no-total-spare - number)
	:precondition 
		(and
		(not-in-unsafe-move)
		(not (closed level_2_2))
		(has-spare ?x ?no-spare-x level_2_2)
		(spare-tiers ?robot ?no-spare-robot level_2_2)
		(robot-at ?robot ?x level_2_2)
		(sum ?no-spare-x ?no-spare-robot ?no-total-spare)
		)
	:effect 
		 
		(and (spare-tiers ?robot ?no-total-spare level_2_2) (has-spare ?x n0 level_2_2) (not (has-spare ?x ?no-spare-x level_2_2)) (not (spare-tiers ?robot ?no-spare-robot level_2_2)) )
 
	)

	(:action use-spare_0_0
	:parameters  ( ?robot - robot ?no-spare-before - number ?no-spare-after - number)
	:precondition 
		(and
		(not-in-unsafe-move)
		(not (closed level_0_0))
		(closed level_1_1)
		(closed level_1_2)
		(closed level_2_1)
		(closed level_2_2)
		(flat level_0_0)
		(spare-tiers ?robot ?no-spare-before level_0_0)
		(use-one ?no-spare-before ?no-spare-after)
		)
	:effect 
		 
		(and (spare-tiers ?robot ?no-spare-after level_0_0) (not (flat level_0_0)) (not (spare-tiers ?robot ?no-spare-before level_0_0)) )
 
	)

	(:action use-spare_1_1
	:parameters  ( ?robot - robot ?no-spare-before - number ?no-spare-after - number)
	:precondition 
		(and
		(not-in-unsafe-move)
		(not (closed level_1_1))
		(closed level_1_2)
		(closed level_2_1)
		(closed level_2_2)
		(flat level_1_1)
		(spare-tiers ?robot ?no-spare-before level_1_1)
		(use-one ?no-spare-before ?no-spare-after)
		)
	:effect 
		 
		(and (spare-tiers ?robot ?no-spare-after level_1_1) (not (flat level_1_1)) (not (spare-tiers ?robot ?no-spare-before level_1_1)) )
 
	)

	(:action use-spare_1_2
	:parameters  ( ?robot - robot ?no-spare-before - number ?no-spare-after - number)
	:precondition 
		(and
		(not-in-unsafe-move)
		(not (closed level_1_2))
		(closed level_2_1)
		(closed level_2_2)
		(flat level_1_2)
		(spare-tiers ?robot ?no-spare-before level_1_2)
		(use-one ?no-spare-before ?no-spare-after)
		)
	:effect 
		 
		(and (spare-tiers ?robot ?no-spare-after level_1_2) (not (flat level_1_2)) (not (spare-tiers ?robot ?no-spare-before level_1_2)) )
 
	)

	(:action use-spare_2_1
	:parameters  ( ?robot - robot ?no-spare-before - number ?no-spare-after - number)
	:precondition 
		(and
		(not-in-unsafe-move)
		(not (closed level_2_1))
		(closed level_2_2)
		(flat level_2_1)
		(spare-tiers ?robot ?no-spare-before level_2_1)
		(use-one ?no-spare-before ?no-spare-after)
		)
	:effect 
		 
		(and (spare-tiers ?robot ?no-spare-after level_2_1) (not (flat level_2_1)) (not (spare-tiers ?robot ?no-spare-before level_2_1)) )
 
	)

	(:action use-spare_2_2
	:parameters  ( ?robot - robot ?no-spare-before - number ?no-spare-after - number)
	:precondition 
		(and
		(not-in-unsafe-move)
		(not (closed level_2_2))
		(flat level_2_2)
		(spare-tiers ?robot ?no-spare-before level_2_2)
		(use-one ?no-spare-before ?no-spare-after)
		)
	:effect 
		 
		(and (spare-tiers ?robot ?no-spare-after level_2_2) (not (flat level_2_2)) (not (spare-tiers ?robot ?no-spare-before level_2_2)) )
 
	)

	(:action copy_substate_pos_unsafe-move
	:parameters  ( ?level - levelType)
	:precondition 
		(and
		(not-in-unsafe-move)
		(not (closed ?level))
		(not (copied-pos-unsafe-move ?level))
		)
	:effect 
		(and
		( forall ( ?x - location ?num - number ?nlevel - levelType)
			(when (and (has-spare ?x ?num ?level) (next-level-of-unsafe-move ?level ?nlevel) ) (has-spare ?x ?num ?nlevel) ))
		( forall ( ?robot - robot ?num - number ?nlevel - levelType)
			(when (and (spare-tiers ?robot ?num ?level) (next-level-of-unsafe-move ?level ?nlevel) ) (spare-tiers ?robot ?num ?nlevel) ))
		( forall ( ?robot - robot ?x - location ?nlevel - levelType)
			(when (and (robot-at ?robot ?x ?level) (next-level-of-unsafe-move ?level ?nlevel) ) (robot-at ?robot ?x ?nlevel) ))
		( forall ( ?nlevel - levelType)
			(when (and (flat ?level) (next-level-of-unsafe-move ?level ?nlevel) ) (flat ?nlevel) ))
		(copied-pos-unsafe-move ?level) 
		(not (not-in-unsafe-move)) 
		)
	)

	(:action copy_substate_neg_unsafe-move
	:parameters  ( ?level - levelType)
	:precondition 
		(and
		(not (not-in-unsafe-move))
		(not (closed ?level))
		(copied-pos-unsafe-move ?level)
		(not (copied-neg-unsafe-move ?level))
		)
	:effect 
		(and
		( forall ( ?x - location ?num - number ?nlevel - levelType)
			(when (and (not (has-spare ?x ?num ?level)) (next-level-of-unsafe-move ?level ?nlevel) ) (not (has-spare ?x ?num ?nlevel)) ))
		( forall ( ?robot - robot ?num - number ?nlevel - levelType)
			(when (and (not (spare-tiers ?robot ?num ?level)) (next-level-of-unsafe-move ?level ?nlevel) ) (not (spare-tiers ?robot ?num ?nlevel)) ))
		( forall ( ?robot - robot ?x - location ?nlevel - levelType)
			(when (and (not (robot-at ?robot ?x ?level)) (next-level-of-unsafe-move ?level ?nlevel) ) (not (robot-at ?robot ?x ?nlevel)) ))
		( forall ( ?nlevel - levelType)
			(when (and (not (flat ?level)) (next-level-of-unsafe-move ?level ?nlevel) ) (not (flat ?nlevel)) ))
		(copied-neg-unsafe-move ?level) 
		)
	)

	(:action goal_achieved_level_0_0
	:parameters  ()
	:precondition 
		(and
		(not-in-unsafe-move)
		(not (closed level_0_0))
		(closed level_1_1)
		(closed level_1_2)
		(closed level_2_1)
		(closed level_2_2)
		(robot-at bot x5 level_0_0)
		)
	:effect 
		 
		(closed level_0_0) 
 
	)

	(:action goal_achieved_level_1_1
	:parameters  ()
	:precondition 
		(and
		(not-in-unsafe-move)
		(not (closed level_1_1))
		(closed level_1_2)
		(closed level_2_1)
		(closed level_2_2)
		(robot-at bot x5 level_1_1)
		)
	:effect 
		 
		(closed level_1_1) 
 
	)

	(:action goal_achieved_level_1_2
	:parameters  ()
	:precondition 
		(and
		(not-in-unsafe-move)
		(not (closed level_1_2))
		(closed level_2_1)
		(closed level_2_2)
		(robot-at bot x5 level_1_2)
		)
	:effect 
		 
		(closed level_1_2) 
 
	)

	(:action goal_achieved_level_2_1
	:parameters  ()
	:precondition 
		(and
		(not-in-unsafe-move)
		(not (closed level_2_1))
		(closed level_2_2)
		(robot-at bot x5 level_2_1)
		)
	:effect 
		 
		(closed level_2_1) 
 
	)

	(:action goal_achieved_level_2_2
	:parameters  ()
	:precondition 
		(and
		(not-in-unsafe-move)
		(not (closed level_2_2))
		(robot-at bot x5 level_2_2)
		)
	:effect 
		 
		(closed level_2_2) 
 
	)
)