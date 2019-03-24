extends "res://input_handler/input_communicator/input_communicator.gd"
signal crouched()
signal attacked_mele()

func communicate_input(input_data):
	communicate_movement_input_direction(input_data)
	communicate_jump(input_data)
	communicate_crouch(input_data)
	communicate_attack_mele(input_data)

func communicate_movement_input_direction(input_data):
	var movement_direction = Vector2()
	movement_direction.x = int(input_data.move_right) - int(input_data.move_left)
	movement_direction.y = int(input_data.move_down) - int(input_data.move_up)
	emit_signal("moved", movement_direction)

func communicate_jump(input_data):
	if input_data.jump:
		emit_signal("jumped")

func communicate_crouch(input_data):
	if input_data.crouch:
		emit_signal("crouched")

func communicate_attack_mele(input_data):
	if input_data.mele_attack:
		emit_signal("attacked_mele")