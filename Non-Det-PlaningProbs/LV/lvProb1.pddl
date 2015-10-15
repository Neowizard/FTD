(define (problem lvProb01)
(:domain lv-Domain)

(:objects 
	rob1 - robot
	n0 - number
	n1 - number
	n2 - number
	n3 - number
	n4 - number
	level_0_0 - levelType
	level_1_1 - levelType
	level_2_1 - levelType
	level_3_1 - levelType
)

(:init
	(add-one n0 n1)
	(add-one n1 n2)
	(add-one n2 n3)
	(add-one n3 n4)
	(above n1 n0)
	(above n2 n0)
	(above n3 n0)
	(above n4 n0)
	(above n2 n1)
	(above n3 n1)
	(above n4 n1)
	(above n3 n2)
	(above n4 n2)
	(above n4 n3)
	(location n0 n0)
	(location n0 n1)
	(location n1 n0)
	(location n1 n1)
	(location n0 n2)
	(location n2 n0)
	(location n1 n2)
	(location n2 n1)
	(location n2 n2)
	(location n0 n3)
	(location n3 n0)
	(location n1 n3)
	(location n3 n1)
	(location n2 n3)
	(location n3 n2)
	(location n3 n3)
	(location n0 n4)
	(location n4 n0)
	(location n1 n4)
	(location n4 n1)
	(location n2 n4)
	(location n4 n2)
	(location n3 n4)
	(location n4 n3)
	(location n4 n4)
	(at rob1 n0 n4 level_0_0)
	(not-in-risky-right)
	(not-in-risky-left)
	(not-in-risky-up)
	(not-in-risky-down)
	(closed level_1_1)
	(closed level_2_1)
	(closed level_3_1)
	(next-level-of-risky-right level_0_0 level_1_1)
	(next-level-of-risky-left level_0_0 level_1_1)
	(next-level-of-risky-up level_0_0 level_1_1)
	(next-level-of-risky-down level_0_0 level_1_1)
	(next-level-of-risky-right level_1_1 level_2_1)
	(next-level-of-risky-left level_1_1 level_2_1)
	(next-level-of-risky-up level_1_1 level_2_1)
	(next-level-of-risky-down level_1_1 level_2_1)
	(next-level-of-risky-right level_2_1 level_3_1)
	(next-level-of-risky-left level_2_1 level_3_1)
	(next-level-of-risky-up level_2_1 level_3_1)
	(next-level-of-risky-down level_2_1 level_3_1)
)

(:goal
	(closed level_0_0)
)
)