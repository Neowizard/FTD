(define (domain lv-Domain)
	(:types number robot levelType)
	(:predicates
		(add-one ?no1 - number ?no2 - number)
		(above ?no1 - number ?no2 - number)
		(location ?x - number ?y - number)
		(at ?robot - robot ?x - number ?y - number ?level - levelType)
		(not-in-risky-right)
		(not-in-risky-left)
		(not-in-risky-up)
		(not-in-risky-down)
		(closed ?level - levelType)
		(next-level-of-risky-right ?level1 - levelType ?level2 - levelType)
		(copied-pos-risky-right ?level - levelType)
		(copied-neg-risky-right ?level - levelType)
		(next-level-of-risky-left ?level1 - levelType ?level2 - levelType)
		(copied-pos-risky-left ?level - levelType)
		(copied-neg-risky-left ?level - levelType)
		(next-level-of-risky-up ?level1 - levelType ?level2 - levelType)
		(copied-pos-risky-up ?level - levelType)
		(copied-neg-risky-up ?level - levelType)
		(next-level-of-risky-down ?level1 - levelType ?level2 - levelType)
		(copied-pos-risky-down ?level - levelType)
		(copied-neg-risky-down ?level - levelType)
	)

	(:action right_0_0
	:parameters  ( ?rob - robot ?from-x - number ?from-y - number ?to-x - number ?to-y - number)
	:precondition 
		(and
		(not-in-risky-right)
		(not-in-risky-left)
		(not-in-risky-up)
		(not-in-risky-down)
		(not (closed level_0_0))
		(closed level_1_1)
		(closed level_2_1)
		(closed level_3_1)
		(location ?from-x ?from-y)
		(location ?to-x ?to-y)
		(add-one ?from-x ?to-x)
		(= ?from-y ?to-y)
		(at ?rob ?from-x ?from-y level_0_0)
		(not (above ?from-y ?from-x))
		)
	:effect 
		 
		(and (at ?rob ?to-x ?to-y level_0_0) (not (at ?rob ?from-x ?from-y level_0_0)) )
 
	)

	(:action right_1_1
	:parameters  ( ?rob - robot ?from-x - number ?from-y - number ?to-x - number ?to-y - number)
	:precondition 
		(and
		(not-in-risky-right)
		(not-in-risky-left)
		(not-in-risky-up)
		(not-in-risky-down)
		(not (closed level_1_1))
		(closed level_2_1)
		(closed level_3_1)
		(location ?from-x ?from-y)
		(location ?to-x ?to-y)
		(add-one ?from-x ?to-x)
		(= ?from-y ?to-y)
		(at ?rob ?from-x ?from-y level_1_1)
		(not (above ?from-y ?from-x))
		)
	:effect 
		 
		(and (at ?rob ?to-x ?to-y level_1_1) (not (at ?rob ?from-x ?from-y level_1_1)) )
 
	)

	(:action right_2_1
	:parameters  ( ?rob - robot ?from-x - number ?from-y - number ?to-x - number ?to-y - number)
	:precondition 
		(and
		(not-in-risky-right)
		(not-in-risky-left)
		(not-in-risky-up)
		(not-in-risky-down)
		(not (closed level_2_1))
		(closed level_3_1)
		(location ?from-x ?from-y)
		(location ?to-x ?to-y)
		(add-one ?from-x ?to-x)
		(= ?from-y ?to-y)
		(at ?rob ?from-x ?from-y level_2_1)
		(not (above ?from-y ?from-x))
		)
	:effect 
		 
		(and (at ?rob ?to-x ?to-y level_2_1) (not (at ?rob ?from-x ?from-y level_2_1)) )
 
	)

	(:action right_3_1
	:parameters  ( ?rob - robot ?from-x - number ?from-y - number ?to-x - number ?to-y - number)
	:precondition 
		(and
		(not-in-risky-right)
		(not-in-risky-left)
		(not-in-risky-up)
		(not-in-risky-down)
		(not (closed level_3_1))
		(location ?from-x ?from-y)
		(location ?to-x ?to-y)
		(add-one ?from-x ?to-x)
		(= ?from-y ?to-y)
		(at ?rob ?from-x ?from-y level_3_1)
		(not (above ?from-y ?from-x))
		)
	:effect 
		 
		(and (at ?rob ?to-x ?to-y level_3_1) (not (at ?rob ?from-x ?from-y level_3_1)) )
 
	)

	(:action risky-right_0_0
	:parameters  ( ?rob - robot ?from-x - number ?from-y - number ?to-x - number ?to-y - number)
	:precondition 
		(and
		(not (not-in-risky-right))
		(copied-pos-risky-right level_0_0)
		(copied-neg-risky-right level_0_0)
		(not-in-risky-left)
		(not-in-risky-up)
		(not-in-risky-down)
		(not (closed level_0_0))
		(closed level_1_1)
		(closed level_2_1)
		(closed level_3_1)
		(location ?from-x ?from-y)
		(location ?to-x ?to-y)
		(add-one ?from-x ?to-x)
		(= ?from-y ?to-y)
		(at ?rob ?from-x ?from-y level_0_0)
		(above ?from-y ?from-x)
		)
	:effect 
		(and
		(and (at ?rob ?to-x ?to-y level_0_0) (not (at ?rob ?from-x ?from-y level_0_0)) )
		(and (not (closed level_1_1)) (at ?rob ?from-y ?from-x level_1_1) (not (at ?rob ?from-x ?from-y level_1_1)) )
		(not-in-risky-right) 
		(not (copied-pos-risky-right level_0_0)) 
		(not (copied-neg-risky-right level_0_0)) 
		)
	)

	(:action risky-right_1_1
	:parameters  ( ?rob - robot ?from-x - number ?from-y - number ?to-x - number ?to-y - number)
	:precondition 
		(and
		(not (not-in-risky-right))
		(copied-pos-risky-right level_1_1)
		(copied-neg-risky-right level_1_1)
		(not-in-risky-left)
		(not-in-risky-up)
		(not-in-risky-down)
		(not (closed level_1_1))
		(closed level_2_1)
		(closed level_3_1)
		(location ?from-x ?from-y)
		(location ?to-x ?to-y)
		(add-one ?from-x ?to-x)
		(= ?from-y ?to-y)
		(at ?rob ?from-x ?from-y level_1_1)
		(above ?from-y ?from-x)
		)
	:effect 
		(and
		(and (at ?rob ?to-x ?to-y level_1_1) (not (at ?rob ?from-x ?from-y level_1_1)) )
		(and (not (closed level_2_1)) (at ?rob ?from-y ?from-x level_2_1) (not (at ?rob ?from-x ?from-y level_2_1)) )
		(not-in-risky-right) 
		(not (copied-pos-risky-right level_1_1)) 
		(not (copied-neg-risky-right level_1_1)) 
		)
	)

	(:action risky-right_2_1
	:parameters  ( ?rob - robot ?from-x - number ?from-y - number ?to-x - number ?to-y - number)
	:precondition 
		(and
		(not (not-in-risky-right))
		(copied-pos-risky-right level_2_1)
		(copied-neg-risky-right level_2_1)
		(not-in-risky-left)
		(not-in-risky-up)
		(not-in-risky-down)
		(not (closed level_2_1))
		(closed level_3_1)
		(location ?from-x ?from-y)
		(location ?to-x ?to-y)
		(add-one ?from-x ?to-x)
		(= ?from-y ?to-y)
		(at ?rob ?from-x ?from-y level_2_1)
		(above ?from-y ?from-x)
		)
	:effect 
		(and
		(and (at ?rob ?to-x ?to-y level_2_1) (not (at ?rob ?from-x ?from-y level_2_1)) )
		(and (not (closed level_3_1)) (at ?rob ?from-y ?from-x level_3_1) (not (at ?rob ?from-x ?from-y level_3_1)) )
		(not-in-risky-right) 
		(not (copied-pos-risky-right level_2_1)) 
		(not (copied-neg-risky-right level_2_1)) 
		)
	)

	(:action risky-right_3_1
	:parameters  ( ?rob - robot ?from-x - number ?from-y - number ?to-x - number ?to-y - number)
	:precondition 
		(and
		(not (not-in-risky-right))
		(copied-pos-risky-right level_3_1)
		(copied-neg-risky-right level_3_1)
		(not-in-risky-left)
		(not-in-risky-up)
		(not-in-risky-down)
		(not (closed level_3_1))
		(location ?from-x ?from-y)
		(location ?to-x ?to-y)
		(add-one ?from-x ?to-x)
		(= ?from-y ?to-y)
		(at ?rob ?from-x ?from-y level_3_1)
		(above ?from-y ?from-x)
		)
	:effect 
		(and
		(and (at ?rob ?to-x ?to-y level_3_1) (not (at ?rob ?from-x ?from-y level_3_1)) )
		(not-in-risky-right) 
		(not (copied-pos-risky-right level_3_1)) 
		(not (copied-neg-risky-right level_3_1)) 
		)
	)

	(:action left_0_0
	:parameters  ( ?rob - robot ?from-x - number ?from-y - number ?to-x - number ?to-y - number)
	:precondition 
		(and
		(not-in-risky-right)
		(not-in-risky-left)
		(not-in-risky-up)
		(not-in-risky-down)
		(not (closed level_0_0))
		(closed level_1_1)
		(closed level_2_1)
		(closed level_3_1)
		(location ?from-x ?from-y)
		(location ?to-x ?to-y)
		(add-one ?to-x ?from-x)
		(= ?from-y ?to-y)
		(at ?rob ?from-x ?from-y level_0_0)
		(not (above ?from-y ?from-x))
		)
	:effect 
		 
		(and (at ?rob ?to-x ?to-y level_0_0) (not (at ?rob ?from-x ?from-y level_0_0)) )
 
	)

	(:action left_1_1
	:parameters  ( ?rob - robot ?from-x - number ?from-y - number ?to-x - number ?to-y - number)
	:precondition 
		(and
		(not-in-risky-right)
		(not-in-risky-left)
		(not-in-risky-up)
		(not-in-risky-down)
		(not (closed level_1_1))
		(closed level_2_1)
		(closed level_3_1)
		(location ?from-x ?from-y)
		(location ?to-x ?to-y)
		(add-one ?to-x ?from-x)
		(= ?from-y ?to-y)
		(at ?rob ?from-x ?from-y level_1_1)
		(not (above ?from-y ?from-x))
		)
	:effect 
		 
		(and (at ?rob ?to-x ?to-y level_1_1) (not (at ?rob ?from-x ?from-y level_1_1)) )
 
	)

	(:action left_2_1
	:parameters  ( ?rob - robot ?from-x - number ?from-y - number ?to-x - number ?to-y - number)
	:precondition 
		(and
		(not-in-risky-right)
		(not-in-risky-left)
		(not-in-risky-up)
		(not-in-risky-down)
		(not (closed level_2_1))
		(closed level_3_1)
		(location ?from-x ?from-y)
		(location ?to-x ?to-y)
		(add-one ?to-x ?from-x)
		(= ?from-y ?to-y)
		(at ?rob ?from-x ?from-y level_2_1)
		(not (above ?from-y ?from-x))
		)
	:effect 
		 
		(and (at ?rob ?to-x ?to-y level_2_1) (not (at ?rob ?from-x ?from-y level_2_1)) )
 
	)

	(:action left_3_1
	:parameters  ( ?rob - robot ?from-x - number ?from-y - number ?to-x - number ?to-y - number)
	:precondition 
		(and
		(not-in-risky-right)
		(not-in-risky-left)
		(not-in-risky-up)
		(not-in-risky-down)
		(not (closed level_3_1))
		(location ?from-x ?from-y)
		(location ?to-x ?to-y)
		(add-one ?to-x ?from-x)
		(= ?from-y ?to-y)
		(at ?rob ?from-x ?from-y level_3_1)
		(not (above ?from-y ?from-x))
		)
	:effect 
		 
		(and (at ?rob ?to-x ?to-y level_3_1) (not (at ?rob ?from-x ?from-y level_3_1)) )
 
	)

	(:action risky-left_0_0
	:parameters  ( ?rob - robot ?from-x - number ?from-y - number ?to-x - number ?to-y - number)
	:precondition 
		(and
		(not (not-in-risky-left))
		(copied-pos-risky-left level_0_0)
		(copied-neg-risky-left level_0_0)
		(not-in-risky-right)
		(not-in-risky-up)
		(not-in-risky-down)
		(not (closed level_0_0))
		(closed level_1_1)
		(closed level_2_1)
		(closed level_3_1)
		(location ?from-x ?from-y)
		(location ?to-x ?to-y)
		(add-one ?to-x ?from-x)
		(= ?from-y ?to-y)
		(at ?rob ?from-x ?from-y level_0_0)
		(above ?from-y ?from-x)
		)
	:effect 
		(and
		(and (at ?rob ?to-x ?to-y level_0_0) (not (at ?rob ?from-x ?from-y level_0_0)) )
		(and (not (closed level_1_1)) (at ?rob ?from-y ?from-x level_1_1) (not (at ?rob ?from-x ?from-y level_1_1)) )
		(not-in-risky-left) 
		(not (copied-pos-risky-left level_0_0)) 
		(not (copied-neg-risky-left level_0_0)) 
		)
	)

	(:action risky-left_1_1
	:parameters  ( ?rob - robot ?from-x - number ?from-y - number ?to-x - number ?to-y - number)
	:precondition 
		(and
		(not (not-in-risky-left))
		(copied-pos-risky-left level_1_1)
		(copied-neg-risky-left level_1_1)
		(not-in-risky-right)
		(not-in-risky-up)
		(not-in-risky-down)
		(not (closed level_1_1))
		(closed level_2_1)
		(closed level_3_1)
		(location ?from-x ?from-y)
		(location ?to-x ?to-y)
		(add-one ?to-x ?from-x)
		(= ?from-y ?to-y)
		(at ?rob ?from-x ?from-y level_1_1)
		(above ?from-y ?from-x)
		)
	:effect 
		(and
		(and (at ?rob ?to-x ?to-y level_1_1) (not (at ?rob ?from-x ?from-y level_1_1)) )
		(and (not (closed level_2_1)) (at ?rob ?from-y ?from-x level_2_1) (not (at ?rob ?from-x ?from-y level_2_1)) )
		(not-in-risky-left) 
		(not (copied-pos-risky-left level_1_1)) 
		(not (copied-neg-risky-left level_1_1)) 
		)
	)

	(:action risky-left_2_1
	:parameters  ( ?rob - robot ?from-x - number ?from-y - number ?to-x - number ?to-y - number)
	:precondition 
		(and
		(not (not-in-risky-left))
		(copied-pos-risky-left level_2_1)
		(copied-neg-risky-left level_2_1)
		(not-in-risky-right)
		(not-in-risky-up)
		(not-in-risky-down)
		(not (closed level_2_1))
		(closed level_3_1)
		(location ?from-x ?from-y)
		(location ?to-x ?to-y)
		(add-one ?to-x ?from-x)
		(= ?from-y ?to-y)
		(at ?rob ?from-x ?from-y level_2_1)
		(above ?from-y ?from-x)
		)
	:effect 
		(and
		(and (at ?rob ?to-x ?to-y level_2_1) (not (at ?rob ?from-x ?from-y level_2_1)) )
		(and (not (closed level_3_1)) (at ?rob ?from-y ?from-x level_3_1) (not (at ?rob ?from-x ?from-y level_3_1)) )
		(not-in-risky-left) 
		(not (copied-pos-risky-left level_2_1)) 
		(not (copied-neg-risky-left level_2_1)) 
		)
	)

	(:action risky-left_3_1
	:parameters  ( ?rob - robot ?from-x - number ?from-y - number ?to-x - number ?to-y - number)
	:precondition 
		(and
		(not (not-in-risky-left))
		(copied-pos-risky-left level_3_1)
		(copied-neg-risky-left level_3_1)
		(not-in-risky-right)
		(not-in-risky-up)
		(not-in-risky-down)
		(not (closed level_3_1))
		(location ?from-x ?from-y)
		(location ?to-x ?to-y)
		(add-one ?to-x ?from-x)
		(= ?from-y ?to-y)
		(at ?rob ?from-x ?from-y level_3_1)
		(above ?from-y ?from-x)
		)
	:effect 
		(and
		(and (at ?rob ?to-x ?to-y level_3_1) (not (at ?rob ?from-x ?from-y level_3_1)) )
		(not-in-risky-left) 
		(not (copied-pos-risky-left level_3_1)) 
		(not (copied-neg-risky-left level_3_1)) 
		)
	)

	(:action up_0_0
	:parameters  ( ?rob - robot ?from-x - number ?from-y - number ?to-x - number ?to-y - number)
	:precondition 
		(and
		(not-in-risky-right)
		(not-in-risky-left)
		(not-in-risky-up)
		(not-in-risky-down)
		(not (closed level_0_0))
		(closed level_1_1)
		(closed level_2_1)
		(closed level_3_1)
		(location ?from-x ?from-y)
		(location ?to-x ?to-y)
		(add-one ?from-y ?to-y)
		(= ?from-x ?to-x)
		(at ?rob ?from-x ?from-y level_0_0)
		(not (above ?from-y ?from-x))
		)
	:effect 
		 
		(and (at ?rob ?to-x ?to-y level_0_0) (not (at ?rob ?from-x ?from-y level_0_0)) )
 
	)

	(:action up_1_1
	:parameters  ( ?rob - robot ?from-x - number ?from-y - number ?to-x - number ?to-y - number)
	:precondition 
		(and
		(not-in-risky-right)
		(not-in-risky-left)
		(not-in-risky-up)
		(not-in-risky-down)
		(not (closed level_1_1))
		(closed level_2_1)
		(closed level_3_1)
		(location ?from-x ?from-y)
		(location ?to-x ?to-y)
		(add-one ?from-y ?to-y)
		(= ?from-x ?to-x)
		(at ?rob ?from-x ?from-y level_1_1)
		(not (above ?from-y ?from-x))
		)
	:effect 
		 
		(and (at ?rob ?to-x ?to-y level_1_1) (not (at ?rob ?from-x ?from-y level_1_1)) )
 
	)

	(:action up_2_1
	:parameters  ( ?rob - robot ?from-x - number ?from-y - number ?to-x - number ?to-y - number)
	:precondition 
		(and
		(not-in-risky-right)
		(not-in-risky-left)
		(not-in-risky-up)
		(not-in-risky-down)
		(not (closed level_2_1))
		(closed level_3_1)
		(location ?from-x ?from-y)
		(location ?to-x ?to-y)
		(add-one ?from-y ?to-y)
		(= ?from-x ?to-x)
		(at ?rob ?from-x ?from-y level_2_1)
		(not (above ?from-y ?from-x))
		)
	:effect 
		 
		(and (at ?rob ?to-x ?to-y level_2_1) (not (at ?rob ?from-x ?from-y level_2_1)) )
 
	)

	(:action up_3_1
	:parameters  ( ?rob - robot ?from-x - number ?from-y - number ?to-x - number ?to-y - number)
	:precondition 
		(and
		(not-in-risky-right)
		(not-in-risky-left)
		(not-in-risky-up)
		(not-in-risky-down)
		(not (closed level_3_1))
		(location ?from-x ?from-y)
		(location ?to-x ?to-y)
		(add-one ?from-y ?to-y)
		(= ?from-x ?to-x)
		(at ?rob ?from-x ?from-y level_3_1)
		(not (above ?from-y ?from-x))
		)
	:effect 
		 
		(and (at ?rob ?to-x ?to-y level_3_1) (not (at ?rob ?from-x ?from-y level_3_1)) )
 
	)

	(:action risky-up_0_0
	:parameters  ( ?rob - robot ?from-x - number ?from-y - number ?to-x - number ?to-y - number)
	:precondition 
		(and
		(not (not-in-risky-up))
		(copied-pos-risky-up level_0_0)
		(copied-neg-risky-up level_0_0)
		(not-in-risky-right)
		(not-in-risky-left)
		(not-in-risky-down)
		(not (closed level_0_0))
		(closed level_1_1)
		(closed level_2_1)
		(closed level_3_1)
		(location ?from-x ?from-y)
		(location ?to-x ?to-y)
		(add-one ?from-y ?to-y)
		(= ?from-x ?to-x)
		(at ?rob ?from-x ?from-y level_0_0)
		(above ?from-y ?from-x)
		)
	:effect 
		(and
		(and (at ?rob ?to-x ?to-y level_0_0) (not (at ?rob ?from-x ?from-y level_0_0)) )
		(and (not (closed level_1_1)) (at ?rob ?from-y ?from-x level_1_1) (not (at ?rob ?from-x ?from-y level_1_1)) )
		(not-in-risky-up) 
		(not (copied-pos-risky-up level_0_0)) 
		(not (copied-neg-risky-up level_0_0)) 
		)
	)

	(:action risky-up_1_1
	:parameters  ( ?rob - robot ?from-x - number ?from-y - number ?to-x - number ?to-y - number)
	:precondition 
		(and
		(not (not-in-risky-up))
		(copied-pos-risky-up level_1_1)
		(copied-neg-risky-up level_1_1)
		(not-in-risky-right)
		(not-in-risky-left)
		(not-in-risky-down)
		(not (closed level_1_1))
		(closed level_2_1)
		(closed level_3_1)
		(location ?from-x ?from-y)
		(location ?to-x ?to-y)
		(add-one ?from-y ?to-y)
		(= ?from-x ?to-x)
		(at ?rob ?from-x ?from-y level_1_1)
		(above ?from-y ?from-x)
		)
	:effect 
		(and
		(and (at ?rob ?to-x ?to-y level_1_1) (not (at ?rob ?from-x ?from-y level_1_1)) )
		(and (not (closed level_2_1)) (at ?rob ?from-y ?from-x level_2_1) (not (at ?rob ?from-x ?from-y level_2_1)) )
		(not-in-risky-up) 
		(not (copied-pos-risky-up level_1_1)) 
		(not (copied-neg-risky-up level_1_1)) 
		)
	)

	(:action risky-up_2_1
	:parameters  ( ?rob - robot ?from-x - number ?from-y - number ?to-x - number ?to-y - number)
	:precondition 
		(and
		(not (not-in-risky-up))
		(copied-pos-risky-up level_2_1)
		(copied-neg-risky-up level_2_1)
		(not-in-risky-right)
		(not-in-risky-left)
		(not-in-risky-down)
		(not (closed level_2_1))
		(closed level_3_1)
		(location ?from-x ?from-y)
		(location ?to-x ?to-y)
		(add-one ?from-y ?to-y)
		(= ?from-x ?to-x)
		(at ?rob ?from-x ?from-y level_2_1)
		(above ?from-y ?from-x)
		)
	:effect 
		(and
		(and (at ?rob ?to-x ?to-y level_2_1) (not (at ?rob ?from-x ?from-y level_2_1)) )
		(and (not (closed level_3_1)) (at ?rob ?from-y ?from-x level_3_1) (not (at ?rob ?from-x ?from-y level_3_1)) )
		(not-in-risky-up) 
		(not (copied-pos-risky-up level_2_1)) 
		(not (copied-neg-risky-up level_2_1)) 
		)
	)

	(:action risky-up_3_1
	:parameters  ( ?rob - robot ?from-x - number ?from-y - number ?to-x - number ?to-y - number)
	:precondition 
		(and
		(not (not-in-risky-up))
		(copied-pos-risky-up level_3_1)
		(copied-neg-risky-up level_3_1)
		(not-in-risky-right)
		(not-in-risky-left)
		(not-in-risky-down)
		(not (closed level_3_1))
		(location ?from-x ?from-y)
		(location ?to-x ?to-y)
		(add-one ?from-y ?to-y)
		(= ?from-x ?to-x)
		(at ?rob ?from-x ?from-y level_3_1)
		(above ?from-y ?from-x)
		)
	:effect 
		(and
		(and (at ?rob ?to-x ?to-y level_3_1) (not (at ?rob ?from-x ?from-y level_3_1)) )
		(not-in-risky-up) 
		(not (copied-pos-risky-up level_3_1)) 
		(not (copied-neg-risky-up level_3_1)) 
		)
	)

	(:action down_0_0
	:parameters  ( ?rob - robot ?from-x - number ?from-y - number ?to-x - number ?to-y - number)
	:precondition 
		(and
		(not-in-risky-right)
		(not-in-risky-left)
		(not-in-risky-up)
		(not-in-risky-down)
		(not (closed level_0_0))
		(closed level_1_1)
		(closed level_2_1)
		(closed level_3_1)
		(location ?from-x ?from-y)
		(location ?to-x ?to-y)
		(add-one ?to-y ?from-y)
		(= ?from-x ?to-x)
		(at ?rob ?from-x ?from-y level_0_0)
		(not (above ?from-y ?from-x))
		)
	:effect 
		 
		(and (at ?rob ?to-x ?to-y level_0_0) (not (at ?rob ?from-x ?from-y level_0_0)) )
 
	)

	(:action down_1_1
	:parameters  ( ?rob - robot ?from-x - number ?from-y - number ?to-x - number ?to-y - number)
	:precondition 
		(and
		(not-in-risky-right)
		(not-in-risky-left)
		(not-in-risky-up)
		(not-in-risky-down)
		(not (closed level_1_1))
		(closed level_2_1)
		(closed level_3_1)
		(location ?from-x ?from-y)
		(location ?to-x ?to-y)
		(add-one ?to-y ?from-y)
		(= ?from-x ?to-x)
		(at ?rob ?from-x ?from-y level_1_1)
		(not (above ?from-y ?from-x))
		)
	:effect 
		 
		(and (at ?rob ?to-x ?to-y level_1_1) (not (at ?rob ?from-x ?from-y level_1_1)) )
 
	)

	(:action down_2_1
	:parameters  ( ?rob - robot ?from-x - number ?from-y - number ?to-x - number ?to-y - number)
	:precondition 
		(and
		(not-in-risky-right)
		(not-in-risky-left)
		(not-in-risky-up)
		(not-in-risky-down)
		(not (closed level_2_1))
		(closed level_3_1)
		(location ?from-x ?from-y)
		(location ?to-x ?to-y)
		(add-one ?to-y ?from-y)
		(= ?from-x ?to-x)
		(at ?rob ?from-x ?from-y level_2_1)
		(not (above ?from-y ?from-x))
		)
	:effect 
		 
		(and (at ?rob ?to-x ?to-y level_2_1) (not (at ?rob ?from-x ?from-y level_2_1)) )
 
	)

	(:action down_3_1
	:parameters  ( ?rob - robot ?from-x - number ?from-y - number ?to-x - number ?to-y - number)
	:precondition 
		(and
		(not-in-risky-right)
		(not-in-risky-left)
		(not-in-risky-up)
		(not-in-risky-down)
		(not (closed level_3_1))
		(location ?from-x ?from-y)
		(location ?to-x ?to-y)
		(add-one ?to-y ?from-y)
		(= ?from-x ?to-x)
		(at ?rob ?from-x ?from-y level_3_1)
		(not (above ?from-y ?from-x))
		)
	:effect 
		 
		(and (at ?rob ?to-x ?to-y level_3_1) (not (at ?rob ?from-x ?from-y level_3_1)) )
 
	)

	(:action risky-down_0_0
	:parameters  ( ?rob - robot ?from-x - number ?from-y - number ?to-x - number ?to-y - number)
	:precondition 
		(and
		(not (not-in-risky-down))
		(copied-pos-risky-down level_0_0)
		(copied-neg-risky-down level_0_0)
		(not-in-risky-right)
		(not-in-risky-left)
		(not-in-risky-up)
		(not (closed level_0_0))
		(closed level_1_1)
		(closed level_2_1)
		(closed level_3_1)
		(location ?from-x ?from-y)
		(location ?to-x ?to-y)
		(add-one ?to-y ?from-y)
		(= ?from-x ?to-x)
		(at ?rob ?from-x ?from-y level_0_0)
		(above ?from-y ?from-x)
		)
	:effect 
		(and
		(and (at ?rob ?to-x ?to-y level_0_0) (not (at ?rob ?from-x ?from-y level_0_0)) )
		(and (not (closed level_1_1)) (at ?rob ?from-y ?from-x level_1_1) (not (at ?rob ?from-x ?from-y level_1_1)) )
		(not-in-risky-down) 
		(not (copied-pos-risky-down level_0_0)) 
		(not (copied-neg-risky-down level_0_0)) 
		)
	)

	(:action risky-down_1_1
	:parameters  ( ?rob - robot ?from-x - number ?from-y - number ?to-x - number ?to-y - number)
	:precondition 
		(and
		(not (not-in-risky-down))
		(copied-pos-risky-down level_1_1)
		(copied-neg-risky-down level_1_1)
		(not-in-risky-right)
		(not-in-risky-left)
		(not-in-risky-up)
		(not (closed level_1_1))
		(closed level_2_1)
		(closed level_3_1)
		(location ?from-x ?from-y)
		(location ?to-x ?to-y)
		(add-one ?to-y ?from-y)
		(= ?from-x ?to-x)
		(at ?rob ?from-x ?from-y level_1_1)
		(above ?from-y ?from-x)
		)
	:effect 
		(and
		(and (at ?rob ?to-x ?to-y level_1_1) (not (at ?rob ?from-x ?from-y level_1_1)) )
		(and (not (closed level_2_1)) (at ?rob ?from-y ?from-x level_2_1) (not (at ?rob ?from-x ?from-y level_2_1)) )
		(not-in-risky-down) 
		(not (copied-pos-risky-down level_1_1)) 
		(not (copied-neg-risky-down level_1_1)) 
		)
	)

	(:action risky-down_2_1
	:parameters  ( ?rob - robot ?from-x - number ?from-y - number ?to-x - number ?to-y - number)
	:precondition 
		(and
		(not (not-in-risky-down))
		(copied-pos-risky-down level_2_1)
		(copied-neg-risky-down level_2_1)
		(not-in-risky-right)
		(not-in-risky-left)
		(not-in-risky-up)
		(not (closed level_2_1))
		(closed level_3_1)
		(location ?from-x ?from-y)
		(location ?to-x ?to-y)
		(add-one ?to-y ?from-y)
		(= ?from-x ?to-x)
		(at ?rob ?from-x ?from-y level_2_1)
		(above ?from-y ?from-x)
		)
	:effect 
		(and
		(and (at ?rob ?to-x ?to-y level_2_1) (not (at ?rob ?from-x ?from-y level_2_1)) )
		(and (not (closed level_3_1)) (at ?rob ?from-y ?from-x level_3_1) (not (at ?rob ?from-x ?from-y level_3_1)) )
		(not-in-risky-down) 
		(not (copied-pos-risky-down level_2_1)) 
		(not (copied-neg-risky-down level_2_1)) 
		)
	)

	(:action risky-down_3_1
	:parameters  ( ?rob - robot ?from-x - number ?from-y - number ?to-x - number ?to-y - number)
	:precondition 
		(and
		(not (not-in-risky-down))
		(copied-pos-risky-down level_3_1)
		(copied-neg-risky-down level_3_1)
		(not-in-risky-right)
		(not-in-risky-left)
		(not-in-risky-up)
		(not (closed level_3_1))
		(location ?from-x ?from-y)
		(location ?to-x ?to-y)
		(add-one ?to-y ?from-y)
		(= ?from-x ?to-x)
		(at ?rob ?from-x ?from-y level_3_1)
		(above ?from-y ?from-x)
		)
	:effect 
		(and
		(and (at ?rob ?to-x ?to-y level_3_1) (not (at ?rob ?from-x ?from-y level_3_1)) )
		(not-in-risky-down) 
		(not (copied-pos-risky-down level_3_1)) 
		(not (copied-neg-risky-down level_3_1)) 
		)
	)

	(:action copy_substate_pos_risky-right
	:parameters  ( ?level - levelType)
	:precondition 
		(and
		(not-in-risky-left)
		(not-in-risky-up)
		(not-in-risky-down)
		(not-in-risky-right)
		(not (closed ?level))
		(not (copied-pos-risky-right ?level))
		)
	:effect 
		(and
		( forall ( ?robot - robot ?x - number ?y - number ?nlevel - levelType)
			(when (and (at ?robot ?x ?y ?level) (next-level-of-risky-right ?level ?nlevel) ) (at ?robot ?x ?y ?nlevel) ))
		(copied-pos-risky-right ?level) 
		(not (not-in-risky-right)) 
		)
	)

	(:action copy_substate_neg_risky-right
	:parameters  ( ?level - levelType)
	:precondition 
		(and
		(not-in-risky-left)
		(not-in-risky-up)
		(not-in-risky-down)
		(not (not-in-risky-right))
		(not (closed ?level))
		(copied-pos-risky-right ?level)
		(not (copied-neg-risky-right ?level))
		)
	:effect 
		(and
		( forall ( ?robot - robot ?x - number ?y - number ?nlevel - levelType)
			(when (and (not (at ?robot ?x ?y ?level)) (next-level-of-risky-right ?level ?nlevel) ) (not (at ?robot ?x ?y ?nlevel)) ))
		(copied-neg-risky-right ?level) 
		)
	)

	(:action copy_substate_pos_risky-left
	:parameters  ( ?level - levelType)
	:precondition 
		(and
		(not-in-risky-right)
		(not-in-risky-up)
		(not-in-risky-down)
		(not-in-risky-left)
		(not (closed ?level))
		(not (copied-pos-risky-left ?level))
		)
	:effect 
		(and
		( forall ( ?robot - robot ?x - number ?y - number ?nlevel - levelType)
			(when (and (at ?robot ?x ?y ?level) (next-level-of-risky-left ?level ?nlevel) ) (at ?robot ?x ?y ?nlevel) ))
		(copied-pos-risky-left ?level) 
		(not (not-in-risky-left)) 
		)
	)

	(:action copy_substate_neg_risky-left
	:parameters  ( ?level - levelType)
	:precondition 
		(and
		(not-in-risky-right)
		(not-in-risky-up)
		(not-in-risky-down)
		(not (not-in-risky-left))
		(not (closed ?level))
		(copied-pos-risky-left ?level)
		(not (copied-neg-risky-left ?level))
		)
	:effect 
		(and
		( forall ( ?robot - robot ?x - number ?y - number ?nlevel - levelType)
			(when (and (not (at ?robot ?x ?y ?level)) (next-level-of-risky-left ?level ?nlevel) ) (not (at ?robot ?x ?y ?nlevel)) ))
		(copied-neg-risky-left ?level) 
		)
	)

	(:action copy_substate_pos_risky-up
	:parameters  ( ?level - levelType)
	:precondition 
		(and
		(not-in-risky-right)
		(not-in-risky-left)
		(not-in-risky-down)
		(not-in-risky-up)
		(not (closed ?level))
		(not (copied-pos-risky-up ?level))
		)
	:effect 
		(and
		( forall ( ?robot - robot ?x - number ?y - number ?nlevel - levelType)
			(when (and (at ?robot ?x ?y ?level) (next-level-of-risky-up ?level ?nlevel) ) (at ?robot ?x ?y ?nlevel) ))
		(copied-pos-risky-up ?level) 
		(not (not-in-risky-up)) 
		)
	)

	(:action copy_substate_neg_risky-up
	:parameters  ( ?level - levelType)
	:precondition 
		(and
		(not-in-risky-right)
		(not-in-risky-left)
		(not-in-risky-down)
		(not (not-in-risky-up))
		(not (closed ?level))
		(copied-pos-risky-up ?level)
		(not (copied-neg-risky-up ?level))
		)
	:effect 
		(and
		( forall ( ?robot - robot ?x - number ?y - number ?nlevel - levelType)
			(when (and (not (at ?robot ?x ?y ?level)) (next-level-of-risky-up ?level ?nlevel) ) (not (at ?robot ?x ?y ?nlevel)) ))
		(copied-neg-risky-up ?level) 
		)
	)

	(:action copy_substate_pos_risky-down
	:parameters  ( ?level - levelType)
	:precondition 
		(and
		(not-in-risky-right)
		(not-in-risky-left)
		(not-in-risky-up)
		(not-in-risky-down)
		(not (closed ?level))
		(not (copied-pos-risky-down ?level))
		)
	:effect 
		(and
		( forall ( ?robot - robot ?x - number ?y - number ?nlevel - levelType)
			(when (and (at ?robot ?x ?y ?level) (next-level-of-risky-down ?level ?nlevel) ) (at ?robot ?x ?y ?nlevel) ))
		(copied-pos-risky-down ?level) 
		(not (not-in-risky-down)) 
		)
	)

	(:action copy_substate_neg_risky-down
	:parameters  ( ?level - levelType)
	:precondition 
		(and
		(not-in-risky-right)
		(not-in-risky-left)
		(not-in-risky-up)
		(not (not-in-risky-down))
		(not (closed ?level))
		(copied-pos-risky-down ?level)
		(not (copied-neg-risky-down ?level))
		)
	:effect 
		(and
		( forall ( ?robot - robot ?x - number ?y - number ?nlevel - levelType)
			(when (and (not (at ?robot ?x ?y ?level)) (next-level-of-risky-down ?level ?nlevel) ) (not (at ?robot ?x ?y ?nlevel)) ))
		(copied-neg-risky-down ?level) 
		)
	)

	(:action goal_achieved_level_0_0
	:parameters  ()
	:precondition 
		(and
		(not-in-risky-right)
		(not-in-risky-left)
		(not-in-risky-up)
		(not-in-risky-down)
		(not (closed level_0_0))
		(closed level_1_1)
		(closed level_2_1)
		(closed level_3_1)
		(at rob1 n2 n2 level_0_0)
		)
	:effect 
		 
		(closed level_0_0) 
 
	)

	(:action goal_achieved_level_1_1
	:parameters  ()
	:precondition 
		(and
		(not-in-risky-right)
		(not-in-risky-left)
		(not-in-risky-up)
		(not-in-risky-down)
		(not (closed level_1_1))
		(closed level_2_1)
		(closed level_3_1)
		(at rob1 n2 n2 level_1_1)
		)
	:effect 
		 
		(closed level_1_1) 
 
	)

	(:action goal_achieved_level_2_1
	:parameters  ()
	:precondition 
		(and
		(not-in-risky-right)
		(not-in-risky-left)
		(not-in-risky-up)
		(not-in-risky-down)
		(not (closed level_2_1))
		(closed level_3_1)
		(at rob1 n2 n2 level_2_1)
		)
	:effect 
		 
		(closed level_2_1) 
 
	)

	(:action goal_achieved_level_3_1
	:parameters  ()
	:precondition 
		(and
		(not-in-risky-right)
		(not-in-risky-left)
		(not-in-risky-up)
		(not-in-risky-down)
		(not (closed level_3_1))
		(at rob1 n2 n2 level_3_1)
		)
	:effect 
		 
		(closed level_3_1) 
 
	)
)