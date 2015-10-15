(define (problem Omlette-03)
(:domain Omlette)

(:objects 
	bowl1 - bowl
	bowl2 - bowl
	n0 - number
	n1 - number
	n2 - number
	n3 - number
	level_0_0 - levelType
	level_1_1 - levelType
)

(:init
	(sum n1 n1 n2)
	(sum n1 n2 n3)
	(sum n2 n1 n3)
	(add-one n0 n1)
	(add-one n1 n2)
	(add-one n2 n3)
	(has bowl1 n0 level_0_0)
	(has bowl2 n0 level_0_0)
	(unspoiled bowl1 level_0_0)
	(unspoiled bowl2 level_0_0)
	(not-in-break-in)
	(closed level_1_1)
	(next-level-of-break-in level_0_0 level_1_1)
)

(:goal
	(closed level_0_0)
)
)