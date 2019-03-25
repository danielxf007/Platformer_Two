extends "res://character/body_state_machine/motion/motion.gd"

export(float) var MAX_WALKING_SPEED = 150.0
export(float) var MIN_WALKING_SPEED = 10.0
export(float) var WALKING_FORCE = 1000.0
export(float) var FRICTION_FORCE = 0.0
export(float) var MAX_ANGLE_SLOPE = 60
onready var on_floor_ray_right = owner.get_node("OnFloorRight")
onready var on_floor_ray_left = owner.get_node("OnFloorLeft")
var speed_x = 0.0

func enter():
	active_state = true
	emit_signal("state_entered", "move")

func exit(next_state):
	if active_state:
		active_state = false
		emit_signal("finished", next_state)

func update(delta):
	var direction = get_move_direction()
	if not direction:
		speed_x = 0.0
		exit("Idle")
	else:
		move(direction, delta)
	if not on_floor_ray_right.is_colliding() and not on_floor_ray_left.is_colliding():
		speed_x = 0.0
		exit("Fall")

func move(direction, delta):
	calculate_speed(delta)
	var velocity = Vector2(direction.x * speed_x, GRAVITY_FORCE)
	owner.move_and_slide(velocity, FLOOR_NORMAL, MAX_ANGLE_SLOPE)

func calculate_speed(delta):
	var total_force = calculate_total_force()
	speed_x += total_force * delta
	if speed_x > MAX_WALKING_SPEED:
		speed_x = MAX_WALKING_SPEED
	if speed_x < MIN_WALKING_SPEED:
		speed_x = MIN_WALKING_SPEED

func calculate_total_force():
	return WALKING_FORCE - FRICTION_FORCE