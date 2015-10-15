(define (problem Robot_01)
(:domain Robot)

(:objects 
	x1 - location
	x2 - location
	x3 - location
	x4 - location
	x5 - location
	bot - robot
	n0 - number
	n1 - number
	n2 - number
	level_0_0 - levelType
	level_1_1 - levelType
	level_2_1 - levelType
)

(:init
	(safe-path x1 x2)
	(safe-path x1 x3)
	(safe-path x2 x1)
	(safe-path x3 x1)
	(not-safe-path x3 x4)
	(not-safe-path x4 x3)
	(not-safe-path x2 x4)
	(not-safe-path x4 x2)
	(not-safe-path x5 x4)
	(not-safe-path x4 x5)
	(sum n0 n1 n1)
	(sum n1 n0 n1)
	(sum n1 n1 n2)
	(use-one n2 n1)
	(use-one n1 n0)
	(has-spare x2 n1 level_0_0)
	(has-spare x3 n1 level_0_0)
	(spare-tiers bot n0 level_0_0)
	(robot-at bot x1 level_0_0)
	(not-in-unsafe-move)
	(closed level_1_1)
	(closed level_2_1)
	(next-level-of-unsafe-move level_0_0 level_1_1)
	(next-level-of-unsafe-move level_1_1 level_2_1)
)

(:goal
	(closed level_0_0)
)
)