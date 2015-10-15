(define (domain 8-Puzzle)
	(:types position tile levelType)
	(:predicates
		(increase ?pos1 - position ?pos2 - position)
		(decrease ?pos1 - position ?pos2 - position)
		(broken-bord ?level - levelType)
		(tile-at-pos ?t - tile ?x - position ?y - position ?level - levelType)
		(is-blank ?x - position ?y - position ?level - levelType)
		(not-in-move-left)
		(closed ?level - levelType)
		(next-level-of-move-left ?level1 - levelType ?level2 - levelType)
		(copied-pos-move-left ?level - levelType)
		(copied-neg-move-left ?level - levelType)
	)

	(:action move-left_0_0_e0
	:parameters  ( ?t - tile ?x - position ?y - position ?to_x - position)
	:precondition 
		(and
		(not (not-in-move-left))
		(copied-pos-move-left level_0_0)
		(copied-neg-move-left level_0_0)
		(not (closed level_0_0))
		(closed level_1_1)
		(closed level_1_2)
		(closed level_1_3)
		(closed level_2_1)
		(closed level_2_2)
		(closed level_2_3)
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
		(and (not (closed level_1_3)) (broken-bord level_1_3) )
		(not-in-move-left) 
		(not (copied-pos-move-left level_0_0)) 
		(not (copied-neg-move-left level_0_0)) 
		)
	)

	(:action move-left_0_0_e1
	:parameters  ( ?t - tile ?x - position ?y - position ?to_x - position)
	:precondition 
		(and
		(not (not-in-move-left))
		(copied-pos-move-left level_0_0)
		(copied-neg-move-left level_0_0)
		(not (closed level_0_0))
		(closed level_1_1)
		(closed level_1_2)
		(closed level_1_3)
		(closed level_2_1)
		(closed level_2_2)
		(closed level_2_3)
		(broken-bord level_0_0)
		(tile-at-pos ?t ?x ?y level_0_0)
		(is-blank ?to_x ?y level_0_0)
		(decrease ?x ?to_x)
		)
	:effect 
		(and
		(and (not (closed level_1_0)) (tile-at-pos ?t ?to_x ?y level_1_0) (is-blank ?x ?y level_1_0) (not (tile-at-pos ?t ?x ?y level_1_0)) (not (is-blank ?to_x ?y level_1_0)) )
		(and (not (closed level_1_2)) (not (broken-bord level_1_2)) )
		(and (not (closed level_1_3)) (broken-bord level_1_3) )
		(not-in-move-left) 
		(not (copied-pos-move-left level_0_0)) 
		(not (copied-neg-move-left level_0_0)) 
		)
	)

	(:action move-left_0_0_e2
	:parameters  ( ?t - tile ?x - position ?y - position ?to_x - position)
	:precondition 
		(and
		(not (not-in-move-left))
		(copied-pos-move-left level_0_0)
		(copied-neg-move-left level_0_0)
		(not (closed level_0_0))
		(closed level_1_1)
		(closed level_1_2)
		(closed level_1_3)
		(closed level_2_1)
		(closed level_2_2)
		(closed level_2_3)
		(broken-bord level_0_0)
		(tile-at-pos ?t ?x ?y level_0_0)
		(is-blank ?to_x ?y level_0_0)
		(decrease ?x ?to_x)
		)
	:effect 
		(and
		(and (not (closed level_1_0)) (tile-at-pos ?t ?to_x ?y level_1_0) (is-blank ?x ?y level_1_0) (not (tile-at-pos ?t ?x ?y level_1_0)) (not (is-blank ?to_x ?y level_1_0)) )
		(not (closed level_1_1)) 
		(not (broken-bord level_0_0)) 
		(and (not (closed level_1_3)) (broken-bord level_1_3) )
		(not-in-move-left) 
		(not (copied-pos-move-left level_0_0)) 
		(not (copied-neg-move-left level_0_0)) 
		)
	)

	(:action move-left_0_0_e3
	:parameters  ( ?t - tile ?x - position ?y - position ?to_x - position)
	:precondition 
		(and
		(not (not-in-move-left))
		(copied-pos-move-left level_0_0)
		(copied-neg-move-left level_0_0)
		(not (closed level_0_0))
		(closed level_1_1)
		(closed level_1_2)
		(closed level_1_3)
		(closed level_2_1)
		(closed level_2_2)
		(closed level_2_3)
		(broken-bord level_0_0)
		(tile-at-pos ?t ?x ?y level_0_0)
		(is-blank ?to_x ?y level_0_0)
		(decrease ?x ?to_x)
		)
	:effect 
		(and
		(and (not (closed level_1_0)) (tile-at-pos ?t ?to_x ?y level_1_0) (is-blank ?x ?y level_1_0) (not (tile-at-pos ?t ?x ?y level_1_0)) (not (is-blank ?to_x ?y level_1_0)) )
		(not (closed level_1_1)) 
		(and (not (closed level_1_2)) (not (broken-bord level_1_2)) )
		(broken-bord level_0_0) 
		(not-in-move-left) 
		(not (copied-pos-move-left level_0_0)) 
		(not (copied-neg-move-left level_0_0)) 
		)
	)

	(:action move-left_1_1_e0
	:parameters  ( ?t - tile ?x - position ?y - position ?to_x - position)
	:precondition 
		(and
		(not (not-in-move-left))
		(copied-pos-move-left level_1_1)
		(copied-neg-move-left level_1_1)
		(not (closed level_1_1))
		(closed level_1_2)
		(closed level_1_3)
		(closed level_2_1)
		(closed level_2_2)
		(closed level_2_3)
		(broken-bord level_1_1)
		(tile-at-pos ?t ?x ?y level_1_1)
		(is-blank ?to_x ?y level_1_1)
		(decrease ?x ?to_x)
		)
	:effect 
		(and
		(and (tile-at-pos ?t ?to_x ?y level_1_1) (is-blank ?x ?y level_1_1) (not (tile-at-pos ?t ?x ?y level_1_1)) (not (is-blank ?to_x ?y level_1_1)) )
		(not (closed level_2_1)) 
		(and (not (closed level_2_2)) (not (broken-bord level_2_2)) )
		(and (not (closed level_2_3)) (broken-bord level_2_3) )
		(not-in-move-left) 
		(not (copied-pos-move-left level_1_1)) 
		(not (copied-neg-move-left level_1_1)) 
		)
	)

	(:action move-left_1_1_e1
	:parameters  ( ?t - tile ?x - position ?y - position ?to_x - position)
	:precondition 
		(and
		(not (not-in-move-left))
		(copied-pos-move-left level_1_1)
		(copied-neg-move-left level_1_1)
		(not (closed level_1_1))
		(closed level_1_2)
		(closed level_1_3)
		(closed level_2_1)
		(closed level_2_2)
		(closed level_2_3)
		(broken-bord level_1_1)
		(tile-at-pos ?t ?x ?y level_1_1)
		(is-blank ?to_x ?y level_1_1)
		(decrease ?x ?to_x)
		)
	:effect 
		(and
		(and (not (closed level_2_0)) (tile-at-pos ?t ?to_x ?y level_2_0) (is-blank ?x ?y level_2_0) (not (tile-at-pos ?t ?x ?y level_2_0)) (not (is-blank ?to_x ?y level_2_0)) )
		(and (not (closed level_2_2)) (not (broken-bord level_2_2)) )
		(and (not (closed level_2_3)) (broken-bord level_2_3) )
		(not-in-move-left) 
		(not (copied-pos-move-left level_1_1)) 
		(not (copied-neg-move-left level_1_1)) 
		)
	)

	(:action move-left_1_1_e2
	:parameters  ( ?t - tile ?x - position ?y - position ?to_x - position)
	:precondition 
		(and
		(not (not-in-move-left))
		(copied-pos-move-left level_1_1)
		(copied-neg-move-left level_1_1)
		(not (closed level_1_1))
		(closed level_1_2)
		(closed level_1_3)
		(closed level_2_1)
		(closed level_2_2)
		(closed level_2_3)
		(broken-bord level_1_1)
		(tile-at-pos ?t ?x ?y level_1_1)
		(is-blank ?to_x ?y level_1_1)
		(decrease ?x ?to_x)
		)
	:effect 
		(and
		(and (not (closed level_2_0)) (tile-at-pos ?t ?to_x ?y level_2_0) (is-blank ?x ?y level_2_0) (not (tile-at-pos ?t ?x ?y level_2_0)) (not (is-blank ?to_x ?y level_2_0)) )
		(not (closed level_2_1)) 
		(not (broken-bord level_1_1)) 
		(and (not (closed level_2_3)) (broken-bord level_2_3) )
		(not-in-move-left) 
		(not (copied-pos-move-left level_1_1)) 
		(not (copied-neg-move-left level_1_1)) 
		)
	)

	(:action move-left_1_1_e3
	:parameters  ( ?t - tile ?x - position ?y - position ?to_x - position)
	:precondition 
		(and
		(not (not-in-move-left))
		(copied-pos-move-left level_1_1)
		(copied-neg-move-left level_1_1)
		(not (closed level_1_1))
		(closed level_1_2)
		(closed level_1_3)
		(closed level_2_1)
		(closed level_2_2)
		(closed level_2_3)
		(broken-bord level_1_1)
		(tile-at-pos ?t ?x ?y level_1_1)
		(is-blank ?to_x ?y level_1_1)
		(decrease ?x ?to_x)
		)
	:effect 
		(and
		(and (not (closed level_2_0)) (tile-at-pos ?t ?to_x ?y level_2_0) (is-blank ?x ?y level_2_0) (not (tile-at-pos ?t ?x ?y level_2_0)) (not (is-blank ?to_x ?y level_2_0)) )
		(not (closed level_2_1)) 
		(and (not (closed level_2_2)) (not (broken-bord level_2_2)) )
		(broken-bord level_1_1) 
		(not-in-move-left) 
		(not (copied-pos-move-left level_1_1)) 
		(not (copied-neg-move-left level_1_1)) 
		)
	)

	(:action move-left_1_2_e0
	:parameters  ( ?t - tile ?x - position ?y - position ?to_x - position)
	:precondition 
		(and
		(not (not-in-move-left))
		(copied-pos-move-left level_1_2)
		(copied-neg-move-left level_1_2)
		(not (closed level_1_2))
		(closed level_1_3)
		(closed level_2_1)
		(closed level_2_2)
		(closed level_2_3)
		(broken-bord level_1_2)
		(tile-at-pos ?t ?x ?y level_1_2)
		(is-blank ?to_x ?y level_1_2)
		(decrease ?x ?to_x)
		)
	:effect 
		(and
		(and (tile-at-pos ?t ?to_x ?y level_1_2) (is-blank ?x ?y level_1_2) (not (tile-at-pos ?t ?x ?y level_1_2)) (not (is-blank ?to_x ?y level_1_2)) )
		(not (closed level_2_1)) 
		(and (not (closed level_2_2)) (not (broken-bord level_2_2)) )
		(and (not (closed level_2_3)) (broken-bord level_2_3) )
		(not-in-move-left) 
		(not (copied-pos-move-left level_1_2)) 
		(not (copied-neg-move-left level_1_2)) 
		)
	)

	(:action move-left_1_2_e1
	:parameters  ( ?t - tile ?x - position ?y - position ?to_x - position)
	:precondition 
		(and
		(not (not-in-move-left))
		(copied-pos-move-left level_1_2)
		(copied-neg-move-left level_1_2)
		(not (closed level_1_2))
		(closed level_1_3)
		(closed level_2_1)
		(closed level_2_2)
		(closed level_2_3)
		(broken-bord level_1_2)
		(tile-at-pos ?t ?x ?y level_1_2)
		(is-blank ?to_x ?y level_1_2)
		(decrease ?x ?to_x)
		)
	:effect 
		(and
		(and (not (closed level_2_0)) (tile-at-pos ?t ?to_x ?y level_2_0) (is-blank ?x ?y level_2_0) (not (tile-at-pos ?t ?x ?y level_2_0)) (not (is-blank ?to_x ?y level_2_0)) )
		(and (not (closed level_2_2)) (not (broken-bord level_2_2)) )
		(and (not (closed level_2_3)) (broken-bord level_2_3) )
		(not-in-move-left) 
		(not (copied-pos-move-left level_1_2)) 
		(not (copied-neg-move-left level_1_2)) 
		)
	)

	(:action move-left_1_2_e2
	:parameters  ( ?t - tile ?x - position ?y - position ?to_x - position)
	:precondition 
		(and
		(not (not-in-move-left))
		(copied-pos-move-left level_1_2)
		(copied-neg-move-left level_1_2)
		(not (closed level_1_2))
		(closed level_1_3)
		(closed level_2_1)
		(closed level_2_2)
		(closed level_2_3)
		(broken-bord level_1_2)
		(tile-at-pos ?t ?x ?y level_1_2)
		(is-blank ?to_x ?y level_1_2)
		(decrease ?x ?to_x)
		)
	:effect 
		(and
		(and (not (closed level_2_0)) (tile-at-pos ?t ?to_x ?y level_2_0) (is-blank ?x ?y level_2_0) (not (tile-at-pos ?t ?x ?y level_2_0)) (not (is-blank ?to_x ?y level_2_0)) )
		(not (closed level_2_1)) 
		(not (broken-bord level_1_2)) 
		(and (not (closed level_2_3)) (broken-bord level_2_3) )
		(not-in-move-left) 
		(not (copied-pos-move-left level_1_2)) 
		(not (copied-neg-move-left level_1_2)) 
		)
	)

	(:action move-left_1_2_e3
	:parameters  ( ?t - tile ?x - position ?y - position ?to_x - position)
	:precondition 
		(and
		(not (not-in-move-left))
		(copied-pos-move-left level_1_2)
		(copied-neg-move-left level_1_2)
		(not (closed level_1_2))
		(closed level_1_3)
		(closed level_2_1)
		(closed level_2_2)
		(closed level_2_3)
		(broken-bord level_1_2)
		(tile-at-pos ?t ?x ?y level_1_2)
		(is-blank ?to_x ?y level_1_2)
		(decrease ?x ?to_x)
		)
	:effect 
		(and
		(and (not (closed level_2_0)) (tile-at-pos ?t ?to_x ?y level_2_0) (is-blank ?x ?y level_2_0) (not (tile-at-pos ?t ?x ?y level_2_0)) (not (is-blank ?to_x ?y level_2_0)) )
		(not (closed level_2_1)) 
		(and (not (closed level_2_2)) (not (broken-bord level_2_2)) )
		(broken-bord level_1_2) 
		(not-in-move-left) 
		(not (copied-pos-move-left level_1_2)) 
		(not (copied-neg-move-left level_1_2)) 
		)
	)

	(:action move-left_1_3_e0
	:parameters  ( ?t - tile ?x - position ?y - position ?to_x - position)
	:precondition 
		(and
		(not (not-in-move-left))
		(copied-pos-move-left level_1_3)
		(copied-neg-move-left level_1_3)
		(not (closed level_1_3))
		(closed level_2_1)
		(closed level_2_2)
		(closed level_2_3)
		(broken-bord level_1_3)
		(tile-at-pos ?t ?x ?y level_1_3)
		(is-blank ?to_x ?y level_1_3)
		(decrease ?x ?to_x)
		)
	:effect 
		(and
		(and (tile-at-pos ?t ?to_x ?y level_1_3) (is-blank ?x ?y level_1_3) (not (tile-at-pos ?t ?x ?y level_1_3)) (not (is-blank ?to_x ?y level_1_3)) )
		(not (closed level_2_1)) 
		(and (not (closed level_2_2)) (not (broken-bord level_2_2)) )
		(and (not (closed level_2_3)) (broken-bord level_2_3) )
		(not-in-move-left) 
		(not (copied-pos-move-left level_1_3)) 
		(not (copied-neg-move-left level_1_3)) 
		)
	)

	(:action move-left_1_3_e1
	:parameters  ( ?t - tile ?x - position ?y - position ?to_x - position)
	:precondition 
		(and
		(not (not-in-move-left))
		(copied-pos-move-left level_1_3)
		(copied-neg-move-left level_1_3)
		(not (closed level_1_3))
		(closed level_2_1)
		(closed level_2_2)
		(closed level_2_3)
		(broken-bord level_1_3)
		(tile-at-pos ?t ?x ?y level_1_3)
		(is-blank ?to_x ?y level_1_3)
		(decrease ?x ?to_x)
		)
	:effect 
		(and
		(and (not (closed level_2_0)) (tile-at-pos ?t ?to_x ?y level_2_0) (is-blank ?x ?y level_2_0) (not (tile-at-pos ?t ?x ?y level_2_0)) (not (is-blank ?to_x ?y level_2_0)) )
		(and (not (closed level_2_2)) (not (broken-bord level_2_2)) )
		(and (not (closed level_2_3)) (broken-bord level_2_3) )
		(not-in-move-left) 
		(not (copied-pos-move-left level_1_3)) 
		(not (copied-neg-move-left level_1_3)) 
		)
	)

	(:action move-left_1_3_e2
	:parameters  ( ?t - tile ?x - position ?y - position ?to_x - position)
	:precondition 
		(and
		(not (not-in-move-left))
		(copied-pos-move-left level_1_3)
		(copied-neg-move-left level_1_3)
		(not (closed level_1_3))
		(closed level_2_1)
		(closed level_2_2)
		(closed level_2_3)
		(broken-bord level_1_3)
		(tile-at-pos ?t ?x ?y level_1_3)
		(is-blank ?to_x ?y level_1_3)
		(decrease ?x ?to_x)
		)
	:effect 
		(and
		(and (not (closed level_2_0)) (tile-at-pos ?t ?to_x ?y level_2_0) (is-blank ?x ?y level_2_0) (not (tile-at-pos ?t ?x ?y level_2_0)) (not (is-blank ?to_x ?y level_2_0)) )
		(not (closed level_2_1)) 
		(not (broken-bord level_1_3)) 
		(and (not (closed level_2_3)) (broken-bord level_2_3) )
		(not-in-move-left) 
		(not (copied-pos-move-left level_1_3)) 
		(not (copied-neg-move-left level_1_3)) 
		)
	)

	(:action move-left_1_3_e3
	:parameters  ( ?t - tile ?x - position ?y - position ?to_x - position)
	:precondition 
		(and
		(not (not-in-move-left))
		(copied-pos-move-left level_1_3)
		(copied-neg-move-left level_1_3)
		(not (closed level_1_3))
		(closed level_2_1)
		(closed level_2_2)
		(closed level_2_3)
		(broken-bord level_1_3)
		(tile-at-pos ?t ?x ?y level_1_3)
		(is-blank ?to_x ?y level_1_3)
		(decrease ?x ?to_x)
		)
	:effect 
		(and
		(and (not (closed level_2_0)) (tile-at-pos ?t ?to_x ?y level_2_0) (is-blank ?x ?y level_2_0) (not (tile-at-pos ?t ?x ?y level_2_0)) (not (is-blank ?to_x ?y level_2_0)) )
		(not (closed level_2_1)) 
		(and (not (closed level_2_2)) (not (broken-bord level_2_2)) )
		(broken-bord level_1_3) 
		(not-in-move-left) 
		(not (copied-pos-move-left level_1_3)) 
		(not (copied-neg-move-left level_1_3)) 
		)
	)

	(:action move-left_2_1_e0
	:parameters  ( ?t - tile ?x - position ?y - position ?to_x - position)
	:precondition 
		(and
		(not (not-in-move-left))
		(copied-pos-move-left level_2_1)
		(copied-neg-move-left level_2_1)
		(not (closed level_2_1))
		(closed level_2_2)
		(closed level_2_3)
		(broken-bord level_2_1)
		(tile-at-pos ?t ?x ?y level_2_1)
		(is-blank ?to_x ?y level_2_1)
		(decrease ?x ?to_x)
		)
	:effect 
		(and
		(and (tile-at-pos ?t ?to_x ?y level_2_1) (is-blank ?x ?y level_2_1) (not (tile-at-pos ?t ?x ?y level_2_1)) (not (is-blank ?to_x ?y level_2_1)) )
		(not-in-move-left) 
		(not (copied-pos-move-left level_2_1)) 
		(not (copied-neg-move-left level_2_1)) 
		)
	)

	(:action move-left_2_1_e1
	:parameters  ( ?t - tile ?x - position ?y - position ?to_x - position)
	:precondition 
		(and
		(not (not-in-move-left))
		(copied-pos-move-left level_2_1)
		(copied-neg-move-left level_2_1)
		(not (closed level_2_1))
		(closed level_2_2)
		(closed level_2_3)
		(broken-bord level_2_1)
		(tile-at-pos ?t ?x ?y level_2_1)
		(is-blank ?to_x ?y level_2_1)
		(decrease ?x ?to_x)
		)
	:effect 
		(and
		(not-in-move-left) 
		(not (copied-pos-move-left level_2_1)) 
		(not (copied-neg-move-left level_2_1)) 
		)
	)

	(:action move-left_2_1_e2
	:parameters  ( ?t - tile ?x - position ?y - position ?to_x - position)
	:precondition 
		(and
		(not (not-in-move-left))
		(copied-pos-move-left level_2_1)
		(copied-neg-move-left level_2_1)
		(not (closed level_2_1))
		(closed level_2_2)
		(closed level_2_3)
		(broken-bord level_2_1)
		(tile-at-pos ?t ?x ?y level_2_1)
		(is-blank ?to_x ?y level_2_1)
		(decrease ?x ?to_x)
		)
	:effect 
		(and
		(not (broken-bord level_2_1)) 
		(not-in-move-le