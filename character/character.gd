extends KinematicBody2D

export(Vector2) var look_direction = Vector2()
export(Vector2) var move_direction = Vector2()

func update_look_direction(direction):
	look_direction = direction

func update_move_direction(direction):
	move_direction = direction