extends "res://character/body_state_machine/motion/motion.gd"

export(float) var HORIZONTAL_SPEED = 100.0
onready var on_floor_ray_right = owner.get_node("OnFloorRight")
onready var on_floor_ray_left = owner.get_node("OnFloorLeft")
var vertical_speed = 0.0

func enter():
	active_state = true
	emit_signal("state_entered", "fall")

func exit(next_state):
	if active_state:
		active_state = false
		emit_signal("finished", next_state)

func update(delta):
	var direction = get_move_direction()
	make_fall(direction, delta)
	if on_floor_ray_right.is_colliding() or on_floor_ray_left.is_colliding():
		vertical_speed = 0.0
		exit("Previous")


func make_fall(direction, delta):
	calculate_v_speed(delta)
	var velocity = Vector2(direction.x * HORIZONTAL_SPEED, vertical_speed)
	owner.move_and_slide(velocity, FLOOR_NORMAL)

func calculate_v_speed(delta):
	vertical_speed += GRAVITY_FORCE * delta