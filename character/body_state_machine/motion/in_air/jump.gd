extends "res://character/body_state_machine/motion/motion.gd"

export(float) var VERTICAL_SPEED = 150
export(float) var HORIZONTAL_SPEED = 100
var on_air_time = 0.0
var jump_time

func enter():
	jump_time = calculate_jump_time(VERTICAL_SPEED)

func exit(next_state):
	emit_signal("finished", next_state)

func update(delta):
	on_air_time += delta
	var direction = get_move_direction()
	if on_air_time >= jump_time:
		on_air_time = 0.0
		exit("Fall")

	else:
		make_jump(direction, delta)
		if owner.is_on_floor():
			on_air_time = 0.0
			exit("Previous")
		if owner.is_on_ceiling():
			on_air_time = 0.0
			exit("Fall")

func make_jump(direction, delta):
	var velocity = Vector2(direction.x * HORIZONTAL_SPEED, 
	VERTICAL_SPEED * delta)
	owner.move_and_slide(velocity, FLOOR_NORMAL)

func calculate_jump_time(v_speed):
	var time = v_speed / GRAVITY_FORCE
	return time