(define (problem 8-Puzzle_3X3)
(:domain 8-Puzzle)

(:objects 
	t1 - tile
	t2 - tile
	t3 - tile
	t4 - tile
	t5 - tile
	t6 - tile
	t7 - tile
	t8 - tile
	p1 - position
	p2 - position
	p3 - position
	level_0_0 - levelType
	level_1_1 - levelType
	level_1_2 - levelType
	level_1_3 - levelType
	level_2_1 - levelType
	level_2_2 - levelType
	level_2_3 - levelType
)

(:init
	(increase p1 p2)
	(increase p2 p3)
	(decrease p3 p2)
	(decrease p2 p1)
	(tile-at-pos t1 p1 p3 level_0_0)
	(tile-at-pos t2 p1 p2 level_0_0)
	(tile-at-pos t3 p1 p1 level_0_0)
	(tile-at-pos t4 p2 p3 level_0_0)
	(tile-at-pos t5 p3 p1 level_0_0)
	(tile-at-pos t6 p3 p3 level_0_0)
	(tile-at-pos t7 p3 p2 level_0_0)
	(tile-at-pos t8 p2 p1 level_0_0)
	(is-blank p2 p2 level_0_0)
	(not-in-move-left)
	(closed level_1_1)
	(closed level_1_2)
	(closed level_1_3)
	(closed level_2_1)
	(closed level_2_2)
	(closed level_2_3)
	(next-level-of-move-left level_0_0 level_1_1)
	(next-level-of-move-left level_0_0 level_1_2)
	(next-level-of-move-left level_0_0 level_1_3)
	(next-level-of-move-left level_1_1 level_2_1)
	(next-level-of-move-left level_1_1 level_2_2)
	(next-level-of-move-left level_1_1 level_2_3)
	(next-level-of-move-left level_1_2 level_2_1)
	(next-level-of-move-left level_1_2 level_2_2)
	(next-level-of-move-left level_1_2 level_2_3)
	(next-level-of-move-left level_1_3 level_2_1)
	(next-level-of-move-left level_1_3 level_2_2)
	(next-level-of-move-left level_1_3 level_2_3)
)

(:goal
	(closed level_0_0)
)
)