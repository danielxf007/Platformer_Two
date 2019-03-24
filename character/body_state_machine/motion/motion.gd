extends "res://character/body_state_machine/states/state.gd"

const FLOOR_NORMAL = Vector2(0, -1)
export(float) var  GRAVITY_FORCE = 300.0

func get_move_direction():
	return owner.move_direction