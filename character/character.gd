extends KinematicBody2D

export(Vector2) var look_direction = Vector2()
export(Vector2) var move_direction = Vector2()

func update_look_direction(direction):
	if look_direction == direction:
		return
	if direction.x == 0:
		return
	elif direction.x > 0:
		$Body.flip_h = false
	elif direction.x < 0:
		$Body.flip_h = true
	look_direction = direction

func update_move_direction(direction):
	update_look_direction(Vector2(direction.x, 0))
	if move_direction != direction:
		move_direction = direction

