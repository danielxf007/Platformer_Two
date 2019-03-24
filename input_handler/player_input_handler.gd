extends "res://input_handler/input_handler.gd"

var player_input_data = preload("res://input_handler/input/player_input.gd").new()

func _physics_process(delta):
	get_input()
	emit_signal("got_input", player_input_data)

func get_input():
	player_input_data.move_right = Input.is_action_pressed("right")
	player_input_data.move_left = Input.is_action_pressed("left")
	player_input_data.jump = Input.is_action_pressed("jump")
	player_input_data.crouch = Input.is_action_pressed("crouch")
	player_input_data.mele_attack = Input.is_action_pressed("mele_attack")


func activate_input():
	set_physics_process(true)
	set_process_input(true)

func desactivate_input():
	set_physics_process(false)
	set_process_input(false)

