extends "res://character/body_state_machine/motion/motion.gd"

export(float) var VERTICAL_SPEED = 150
export(float) var HORIZONTAL_SPEED = 100
onready var ceiling_ray = owner.get_node("Ceiling")
onready var on_floor_ray_right = owner.get_node("OnFloorRight")
onready var on_floor_ray_left = owner.get_node("OnFloorLeft")
var on_air_time = 0.0
var jump_time

func enter():
	active_state = true
	jump_time = calculate_jump_time(VERTICAL_SPEED)
	emit_signal("state_entered", "jump")

func exit(next_state):
	if active_state:
		active_state = false
		emit_signal("finished", next_state)

func update(delta):
	on_air_time += delta
	var direction = get_move_direction()
	if on_air_time >= jump_time:
		on_air_time = 0.0
		exit("Fall")
	else:
		make_jump(direction, delta)
	if on_floor_ray_right.is_colliding() or on_floor_ray_left.is_colliding():
		on_air_time = 0.0
		exit("Previous")
	if ceiling_ray.is_colliding():
		on_air_time = 0.0
		exit("Fall")

func make_jump(direction, delta):
	var velocity = Vector2(direction.x * HORIZONTAL_SPEED, 
	- VERTICAL_SPEED)
	owner.move_and_slide(velocity, FLOOR_NORMAL)

func calculate_jump_time(v_speed):
	var time = v_speed / GRAVITY_FORCE
	return time