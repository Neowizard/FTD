(define (domain 8-Puzzle)
	(:types position tile levelType)
	(:predicates
		(increase ?pos1 - position ?pos2 - position)
		(decrease ?pos1 - position ?pos2 - position)
		(broken-bord ?level - levelType)
		(tile-at-pos ?t - tile ?x - position ?y - position ?level - levelType)
		(is-blank ?x - position ?y - position ?level - levelType)
		(not-in-move-left)
		(not-in-move-right)
		(not-in-move-up)
		(not-in-move-down)
		(closed ?level - levelType)
		(next-level-of-move-left ?level1 - levelType ?level2 - levelType)
		(copied-pos-move-left ?level - levelType)
		(copied-neg-move-left ?level - levelType)
		(next-level-of-move-right ?level1 - levelType ?level2 - levelType)
		(copied-pos-move-right ?level - levelType)
		(copied-neg-move-right ?level - levelType)
		(next-level-of-move-up ?level1 - levelType ?level2 - levelType)
		(copied-pos-move-up ?level - levelType)
		(copied-neg-move-up ?level - levelType)
		(next-level-of-move-down ?level1 - levelType ?level2 - levelType)
		(copied-pos-move-down ?level - levelType)
		(copied-neg-move-down ?level - levelType)
	)

	(:action move-left_0_0
	:parameters  ( ?t - tile ?x - position ?y - position ?to_x - position)
	:precondition 
		(and
		(not (not-in-move-left))
		(copied-pos-move-left level_0_0)
		(copied-neg-move-left level_0_0)
		(not-in-move-right)
		(not-in-move-up)
		(not-in-move-down)
		(not (closed level_0_0))
		(closed level_1_1)
		(closed level_1_2)
		(broken-bord level_0_0)
		(tile-at-pos ?t ?x ?y level_0_0)
		(is-blank ?to_x ?y level_0_0)
		(decrease ?x ?to_x)
		)
	:effect 
		(and
		(and (tile-at-pos ?t ?to_x ?y level_0_0) (is-blank ?x ?y level_0_0) (not (tile-at-pos ?t ?x ?y level_0_0)) (not (is-blank ?to_x ?y level_0_0)) )
		(not (closed level_1_1)) 
		(and (not (closed level_1_2)) (not (broken-bord level_1_2)) )
		(not-in-move-left) 
		(not (copied-pos-move-left level_0_0)) 
		(not (copied-neg-move-left level_0_0)) 
		)
	)

	(:action move-left_1_1
	:parameters  ( ?t - tile ?x - position ?y - position ?to_x - position)
	:precondition 
		(and
		(not (not-in-move-left))
		(copied-pos-move-left level_1_1)
		(copied-neg-move-left level_1_1)
		(not-in-move-right)
		(not-in-move-up)
		(not-in-move-down)
		(not (closed level_1_1))
		(closed level_1_2)
		(broken-bord level_1_1)
		(tile-at-pos ?t ?x ?y level_1_1)
		(is-blank ?to_x ?y level_1_1)
		(decrease ?x ?to_x)
		)
	:effect 
		(and
		(and (tile-at-pos ?t ?to_x ?y level_1_1) (is-blank ?x ?y level_1_1) (not (tile-at-pos ?t ?x ?y level_1_1)) (not (is-blank ?to_x ?y level_1_1)) )
		(not-in-move-left) 
		(not (copied-pos-move-left level_1_1)) 
		(not (copied-neg-move-left level_1_1)) 
		)
	)

	(:action move-left_1_2
	:parameters  ( ?t - tile ?x - position ?y - position ?to_x - position)
	:precondition 
		(and
		(not (not-in-move-left))
		(copied-pos-move-left level_1_2)
		(copied-neg-move-left level_1_2)
		(not-in-move-right)
		(not-in-move-up)
		(not-in-move-down)
		(not (closed level_1_2))
		(broken-bord level_1_2)
		(tile-at-pos ?t ?x ?y level_1_2)
		(is-blank ?to_x ?y level_1_2)
		(decrease ?x ?to_x)
		)
	:effect 
		(and
		(and (tile-at-pos ?t ?to_x ?y level_1_2) (is-blank ?x ?y level_1_2) (not (tile-at-pos ?t ?x ?y level_1_2)) (not (is-blank ?to_x ?y level_1_2)) )
		(not-in-move-left) 
		(not (copied-pos-move-left level_1_2)) 
		(not (copied-neg-move-left level_1_2)) 
		)
	)

	(:action move-right_0_0
	:parameters  ( ?t - tile ?x - position ?y - position ?to_x - position)
	:precondition 
		(and
		(not (not-in-move-right))
		(copied-pos-move-right level_0_0)
		(copied-neg-move-right level_0_0)
		(not-in-move-left)
		(not-in-move-up)
		(not-in-move-down)
		(not (closed level_0_0))
		(closed level_1_1)
		(closed level_1_2)
		(broken-bord level_0_0)
		(tile-at-pos ?t ?x ?y level_0_0)
		(is-blank ?to_x ?y level_0_0)
		(increase ?x ?to_x)
		)
	:effect 
		(and
		(and (tile-at-pos ?t ?to_x ?y level_0_0) (is-blank ?x ?y level_0_0) (not (tile-at-pos ?t ?x ?y level_0_0)) (not (is-blank ?to_x ?y level_0_0)) )
		(not (closed level_1_1)) 
		(not-in-move-right) 
		(not (copied-pos-move-right level_0_0)) 
		(not (copied-neg-move-right level_0_0)) 
		)
	)

	(:action move-right_1_1
	:parameters  ( ?t - tile ?x - position ?y - position ?to_x - position)
	:precondition 
		(and
		(not (not-in-move-right))
		(copied-pos-move-right level_1_1)
		(copied-neg-move-right level_1_1)
		(not-in-move-left)
		(not-in-move-up)
		(not-in-move-down)
		(not (closed level_1_1))
		(closed level_1_2)
		(broken-bord level_1_1)
		(tile-at-pos ?t ?x ?y level_1_1)
		(is-blank ?to_x ?y level_1_1)
		(increase ?x ?to_x)
		)
	:effect 
		(and
		(and (tile-at-pos ?t ?to_x ?y level_1_1) (is-blank ?x ?y level_1_1) (not (tile-at-pos ?t ?x ?y level_1_1)) (not (is-blank ?to_x ?y level_1_1)) )
		(not-in-move-right) 
		(not (copied-pos-move-right level_1_1)) 
		(not (copied-neg-move-right level_1_1)) 
		)
	)

	(:action move-right_1_2
	:parameters  ( ?t - tile ?x - position ?y - position ?to_x - position)
	:precondition 
		(and
		(not (not-in-move-right))
		(copied-pos-move-right level_1_2)
		(copied-neg-move-right level_1_2)
		(not-in-move-left)
		(not-in-move-up)
		(not-in-move-down)
		(not (closed level_1_2))
		(broken-bord level_1_2)
		(tile-at-pos ?t ?x ?y level_1_2)
		(is-blank ?to_x ?y level_1_2)
		(increase ?x ?to_x)
		)
	:effect 
		(and
		(and (tile-at-pos ?t ?to_x ?y level_1_2) (is-blank ?x ?y level_1_2) (not (tile-at-pos ?t ?x ?y level_1_2)) (not (is-blank ?to_x ?y level_1_2)) )
		(not-in-move-right) 
		(not (copied-pos-move-right level_1_2)) 
		(not (copied-neg-move-right level_1_2)) 
		)
	)

	(:action move-up_0_0
	:parameters  ( ?t - tile ?x - position ?y - position ?to_y - position)
	:precondition 
		(and
		(not (not-in-move-up))
		(copied-pos-move-up level_0_0)
		(copied-neg-move-up level_0_0)
		(not-in-move-left)
		(not-in-move-right)
		(not-in-move-down)
		(not (closed level_0_0))
		(closed level_1_1)
		(closed level_1_2)
		(broken-bord level_0_0)
		(tile-at-pos ?t ?x ?y level_0_0)
		(is-blank ?x ?to_y level_0_0)
		(increase ?y ?to_y)
		)
	:effect 
		(and
		(and (tile-at-pos ?t ?x ?to_y level_0_0) (is-blank ?x ?y level_0_0) (not (tile-at-pos ?t ?x ?y level_0_0)) (not (is-blank ?x ?to_y level_0_0)) )
		(not (closed level_1_1)) 
		(not-in-move-up) 
		(not (copied-pos-move-up level_0_0)) 
		(not (copied-neg-move-up level_0_0)) 
		)
	)

	(:action move-up_1_1
	:parameters  ( ?t - tile ?x - position ?y - position ?to_y - position)
	:precondition 
		(and
		(not (not-in-move-up))
		(copied-pos-move-up level_1_1)
		(copied-neg-move-up level_1_1)
		(not-in-move-left)
		(not-in-move-right)
		(not-in-move-down)
		(not (closed level_1_1))
		(closed level_1_2)
		(broken-bord level_1_1)
		(tile-at-pos ?t ?x ?y level_1_1)
		(is-blank ?x ?to_y level_1_1)
		(increase ?y ?to_y)
		)
	:effect 
		(and
		(and (tile-at-pos ?t ?x ?to_y level_1_1) (is-blank ?x ?y level_1_1) (not (tile-at-pos ?t ?x ?y level_1_1)) (not (is-blank ?x ?to_y level_1_1)) )
		(not-in-move-up) 
		(not (copied-pos-move-up level_1_1)) 
		(not (copied-neg-move-up level_1_1)) 
		)
	)

	(:action move-up_1_2
	:parameters  ( ?t - tile ?x - position ?y - position ?to_y - position)
	:precondition 
		(and
		(not (not-in-move-up))
		(copied-pos-move-up level_1_2)
		(copied-neg-move-up level_1_2)
		(not-in-move-left)
		(not-in-move-right)
		(not-in-move-down)
		(not (closed level_1_2))
		(broken-bord level_1_2)
		(tile-at-pos ?t ?x ?y level_1_2)
		(is-blank ?x ?to_y level_1_2)
		(increase ?y ?to_y)
		)
	:effect 
		(and
		(and (tile-at-pos ?t ?x ?to_y level_1_2) (is-blank ?x ?y level_1_2) (not (tile-at-pos ?t ?x ?y level_1_2)) (not (is-blank ?x ?to_y level_1_2)) )
		(not-in-move-up) 
		(not (copied-pos-move-up level_1_2)) 
		(not (copied-neg-move-up level_1_2)) 
		)
	)

	(:action move-down_0_0
	:parameters  ( ?t - tile ?x - position ?y - position ?to_y - position)
	:precondition 
		(and
		(not (not-in-move-down))
		(copied-pos-move-down level_0_0)
		(copied-neg-move-down level_0_0)
		(not-in-move-left)
		(not-in-move-right)
		(not-in-move-up)
		(not (closed level_0_0))
		(closed level_1_1)
		(closed level_1_2)
		(broken-bord level_0_0)
		(tile-at-pos ?t ?x ?y level_0_0)
		(is-blank ?x ?to_y level_0_0)
		(decrease ?y ?to_y)
		)
	:effect 
		(and
		(and (tile-at-pos ?t ?x ?to_y level_0_0) (is-blank ?x ?y level_0_0) (not (tile-at-pos ?t ?x ?y level_0_0)) (not (is-blank ?x ?to_y level_0_0)) )
		(not (closed level_1_1)) 
		(not-in-move-down) 
		(not (copied-pos-move-down level_0_0)) 
		(not (copied-neg-move-down level_0_0)) 
		)
	)

	(:action move-down_1_1
	:parameters  ( ?t - tile ?x - position ?y - position ?to_y - position)
	:precondition 
		(and
		(not (not-in-move-down))
		(copied-pos-move-down level_1_1)
		(copied-neg-move-down level_1_1)
		(not-in-move-left)
		(not-in-move-right)
		(not-in-move-up)
		(not (closed level_1_1))
		(closed level_1_2)
		(broken-bord level_1_1)
		(tile-at-pos ?t ?x ?y level_1_1)
		(is-blank ?x ?to_y level_1_1)
		(decrease ?y ?to_y)
		)
	:effect 
		(and
		(and (tile-at-pos ?t ?x ?to_y level_1_1) (is-blank ?x ?y level_1_1) (not (tile-at-pos ?t ?x ?y level_1_1)) (not (is-blank ?x ?to_y level_1_1)) )
		(not-in-move-down) 
		(not (copied-pos-move-down level_1_1)) 
		(not (copied-neg-move-down level_1_1)) 
		)
	)

	(:action move-down_1_2
	:parameters  ( ?t - tile ?x - position ?y - position ?to_y - position)
	:precondition 
		(and
		(not (not-in-move-down))
		(copied-pos-move-down level_1_2)
		(copied-neg-move-down level_1_2)
		(not-in-move-left)
		(not-in-move-right)
		(not-in-move-up)
		(not (closed level_1_2))
		(broken-bord level_1_2)
		(tile-at-pos ?t ?x ?y level_1_2)
		(is-blank ?x ?to_y level_1_2)
		(decrease ?y ?to_y)
		)
	:effect 
		(and
		(and (tile-at-pos ?t ?x ?to_y level_1_2) (is-blank ?x ?y level_1_2) (not (tile-at-pos ?t ?x ?y level_1_2)) (not (is-blank ?x ?to_y level_1_2)) )
		(not-in-move-down) 
		(not (copied-pos-move-down level_1_2)) 
		(not (copied-neg-move-down level_1_2)) 
		)
	)

	(:action copy_substate_pos_move-left
	:parameters  ( ?level - levelType)
	:precondition 
		(and
		(not-in-move-right)
		(not-in-move-up)
		(not-in-move-down)
		(not-in-move-left)
		(not (closed ?level))
		(not (copied-pos-move-left ?level))
		)
	:effect 
		(and
		( forall ( ?nlevel - levelType)
			(when (and (broken-bord ?level) (next-level-of-move-left ?level ?nlevel) ) (broken-bord ?nlevel) ))
		( forall ( ?t - tile ?x - position ?y - position ?nlevel - levelType)
			(when (and (tile-at-pos ?t ?x ?y ?level) (next-level-of-move-left ?level ?nlevel) ) (tile-at-pos ?t ?x ?y ?nlevel) ))
		( forall ( ?x - position ?y - position ?nlevel - levelType)
			(when (and (is-blank ?x ?y ?level) (next-level-of-move-left ?level ?nlevel) ) (is-blank ?x ?y ?nlevel) ))
		(copied-pos-move-left ?level) 
		(not (not-in-move-left)) 
		)
	)

	(:action copy_substate_neg_move-left
	:parameters  ( ?level - levelType)
	:precondition 
		(and
		(not-in-move-right)
		(not-in-move-up)
		(not-in-move-down)
		(not (not-in-move-left))
		(not (closed ?level))
		(copied-pos-move-left ?level)
		(not (copied-neg-move-left ?level))
		)
	:effect 
		(and
		( forall ( ?nlevel - levelType)
			(when (and (not (broken-bord ?level)) (next-level-of-move-left ?level ?nlevel) ) (not (broken-bord ?nlevel)) ))
		( forall ( ?t - tile ?x - position ?y - position ?nlevel - levelType)
			(when (and (not (tile-at-pos ?t ?x ?y ?level)) (next-level-of-move-left ?level ?nlevel) ) (not (tile-at-pos ?t ?x ?y ?nlevel)) ))
		( forall ( ?x - position ?y - position ?nlevel - levelType)
			(when (and (not (is-blank ?x ?y ?level)) (next-level-of-move-left ?level ?nlevel) ) (not (is-blank ?x ?y ?nlevel)) ))
		(copied-neg-move-left ?level) 
		)
	)

	(:action copy_substate_pos_move-right
	:parameters  ( ?level - levelType)
	:precondition 
		(and
		(not-in-move-left)
		(not-in-move-up)
		(not-in-move-down)
		(not-in-move-right)
		(not (closed ?level))
		(not (copied-pos-move-right ?level))
		)
	:effect 
		(and
		( forall ( ?nlevel - levelType)
			(when (and (broken-bord ?level) (next-level-of-move-right ?level ?nlevel) ) (broken-bord ?nlevel) ))
		( forall ( ?t - tile ?x - position ?y - position ?nlevel - levelType)
			(when (and (tile-at-pos ?t ?x ?y ?level) (next-level-of-move-right ?level ?nlevel) ) (tile-at-pos ?t ?x ?y ?nlevel) ))
		( forall ( ?x - position ?y - position ?nlevel - levelType)
			(when (and (is-blank ?x ?y ?level) (next-level-of-move-right ?level ?nlevel) ) (is-blank ?x ?y ?nlevel) ))
		(copied-pos-move-right ?level) 
		(not (not-in-move-right)) 
		)
	)

	(:action copy_substate_neg_move-right
	:parameters  ( ?level - levelType)
	:precondition 
		(and
		(not-in-move-left)
		(not-in-move-up)
		(not-in-move-down)
		(not (not-in-move-right))
		(not (closed ?level))
		(copied-pos-move-right ?level)
		(not (copied-neg-move-right ?level))
		)
	:effect 
		(and
		( forall ( ?nlevel - levelType)
			(when (and (not (broken-bord ?level)) (next-level-of-move-right ?level ?nlevel) ) (not (broken-bord ?nlevel)) ))
		( forall ( ?t - tile ?x - position ?y - position ?nlevel - levelType)
			(when (and (not (tile-at-pos ?t ?x ?y ?level)) (next-level-of-move-right ?level ?nlevel) ) (not (tile-at-pos ?t ?x ?y ?nlevel)) ))
		( forall ( ?x - position ?y - position ?nlevel - levelType)
			(when (and (not (is-blank ?x ?y ?level)) (next-level-of-move-right ?level ?nlevel) ) (not (is-blank ?x ?y ?nlevel)) ))
		(copied-neg-move-right ?level) 
		)
	)

	(:action copy_substate_pos_move-up
	:parameters  ( ?level - levelType)
	:precondition 
		(and
		(not-in-move-left)
		(not-in-move-right)
		(not-in-move-down)
		(not-in-move-up)
		(not (closed ?level))
		(not (copied-pos-move-up ?level))
		)
	:effect 
		(and
		( forall ( ?nlevel - levelType)
			(when (and (broken-bord ?level) (next-level-of-move-up ?level ?nlevel) ) (broken-bord ?nlevel) ))
		( forall ( ?t - tile ?x - position ?y - position ?nlevel - levelType)
			(when (and (tile-at-pos ?t ?x ?y ?level) (next-level-of-move-up ?level ?nlevel) ) (tile-at-pos ?t ?x ?y ?nlevel) ))
		( forall ( ?x - position ?y - position ?nlevel - levelType)
			(when (and (is-blank ?x ?y ?level) (next-level-of-move-up ?level ?nlevel) ) (is-blank ?x ?y ?nlevel) ))
		(copied-pos-move-up ?level) 
		(not (not-in-move-up)) 
		)
	)

	(:action copy_substate_neg_move-up
	:parameters  ( ?level - levelType)
	:precondition 
		(and
		(not-in-move-left)
		(not-in-move-right)
		(not-in-move-down)
		(not (not-in-move-up))
		(not (closed ?level))
		(copied-pos-move-up ?level)
		(not (copied-neg-move-up ?level))
		)
	:effect 
		(and
		( forall ( ?nlevel - levelType)
			(when (and (not (broken-bord ?level)) (next-level-of-move-up ?level ?nlevel) ) (not (broken-bord ?nlevel)) ))
		( forall ( ?t - tile ?x - position ?y - position ?nlevel - levelType)
			(when (and (not (tile-at-pos ?t ?x ?y ?level)) (next-level-of-move-up ?level ?nlevel) ) (not (tile-at-pos ?t ?x ?y ?nlevel)) ))
		( forall ( ?x - position ?y - position ?nlevel - levelType)
			(when (and (not (is-blank ?x ?y ?level)) (next-level-of-move-up ?level ?nlevel) ) (not (is-blank ?x ?y ?nlevel)) ))
		(copied-neg-move-up ?level) 
		)
	)

	(:action copy_substate_pos_move-down
	:parameters  ( ?level - levelType)
	:precondition 
		(and
		(not-in-move-left)
		(not-in-move-right)
		(not-in-move-up)
		(not-in-move-down)
		(not (closed ?level))
		(not (copied-pos-move-down ?level))
		)
	:effect 
		(and
		( forall ( ?nlevel - levelType)
			(when (and (broken-bord ?level) (next-level-of-move-down ?level ?nlevel) ) (broken-bord ?nlevel) ))
		( forall ( ?t - tile ?x - position ?y - position ?nlevel - levelType)
			(when (and (tile-at-pos ?t ?x ?y ?level) (next-level-of-move-down ?level ?nlevel) ) (tile-at-pos ?t ?x ?y ?nlevel) ))
		( forall ( ?x - position ?y - position ?nlevel - levelType)
			(when (and (is-blank ?x ?y ?level) (next-level-of-move-down ?level ?nlevel) ) (is-blank ?x ?y ?nlevel) ))
		(copied-pos-move-down ?level) 
		(not (not-in-move-down)) 
		)
	)

	(:action copy_substate_neg_move-down
	:parameters  ( ?level - levelType)
	:precondition 
		(and
		(not-in-move-left)
		(not-in-move-right)
		(not-in-move-up)
		(not (not-in-move-down))
		(not (closed ?level))
		(copied-pos-move-down ?level)
		(not (copied-neg-move-down ?level))
		)
	:effect 
		(and
		( forall ( ?nlevel - levelType)
			(when (and (not (broken-bord ?level)) (next-level-of-move-down ?level ?nlevel) ) (not (broken-bord ?nlevel)) ))
		( forall ( ?t - tile ?x - position ?y - position ?nlevel - levelType)
			(when (and (not (tile-at-pos ?t ?x ?y ?level)) (next-level-of-move-down ?level ?nlevel) ) (not (tile-at-pos ?t ?x ?y ?nlevel)) ))
		( forall ( ?x - position ?y - position ?nlevel - levelType)
			(when (and (not (is-blank ?x ?y ?level)) (next-level-of-move-down ?level ?nlevel) ) (not (is-blank ?x ?y ?nlevel)) ))
		(copied-neg-move-down ?level) 
		)
	)

	(:action goal_achieved_level_0_0
	:parameters  ()
	:precondition 
		(and
		(not-in-move-left)
		(not-in-move-right)
		(not-in-move-up)
		(not-in-move-down)
		(not (closed level_0_0))
		(closed level_1_1)
		(closed level_1_2)
		(tile-at-pos t1 p1 p3 level_0_0)
		(tile-at-pos t2 p2 p3 level_0_0)
		(tile-at-pos t3 p3 p3 level_0_0)
		(tile-at-pos t4 p1 p2 level_0_0)
		(tile-at-pos t5 p2 p2 level_0_0)
		(tile-at-pos t6 p3 p2 level_0_0)
		(tile-at-pos t7 p1 p1 level_0_0)
		(tile-at-pos t8 p2 p1 level_0_0)
		(is-blank p3 p1 level_0_0)
		)
	:effect 
		 
		(closed level_0_0) 
 
	)

	(:action goal_achieved_level_1_1
	:parameters  ()
	:precondition 
		(and
		(not-in-move-left)
		(not-in-move-right)
		(not-in-move-up)
		(not-in-move-down)
		(not (closed level_1_1))
		(closed level_1_2)
		(tile-at-pos t1 p1 p3 level_1_1)
		(tile-at-pos t2 p2 p3 level_1_1)
		(tile-at-pos t3 p3 p3 level_1_1)
		(tile-at-pos t4 p1 p2 level_1_1)
		(tile-at-pos t5 p2 p2 level_1_1)
		(tile-at-pos t6 p3 p2 level_1_1)
		(tile-at-pos t7 p1 p1 level_1_1)
		(tile-at-pos t8 p2 p1 level_1_1)
		(is-blank p3 p1 level_1_1)
		)
	:effect 
		 
		(closed level_1_1) 
 
	)

	(:action goal_achieved_level_1_2
	:parameters  ()
	:precondition 
		(and
		(not-in-move-left)
		(not-in-move-right)
		(not-in-move-up)
		(not-in-move-down)
		(not (closed level_1_2))
		(tile-at-pos t1 p1 p3 level_1_2)
		(tile-at-pos t2 p2 p3 level_1_2)
		(tile-at-pos t3 p3 p3 level_1_2)
		(tile-at-pos t4 p1 p2 level_1_2)
		(tile-at-pos t5 p2 p2 level_1_2)
		(tile-at-pos t6 p3 p2 level_1_2)
		(tile-at-pos t7 p1 p1 level_1_2)
		(tile-at-pos t8 p2 p1 level_1_2)
		(is-blank p3 p1 level_1_2)
		)
	:effect 
		 
		(closed level_1_2) 
 
	)
)