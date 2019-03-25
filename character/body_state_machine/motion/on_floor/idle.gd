extends "res://character/body_state_machine/motion/motion.gd"

onready var on_floor_ray_right = owner.get_node("OnFloorRight")
onready var on_floor_ray_left = owner.get_node("OnFloorLeft")
export(float) var MAX_ANGLE_SLOPE = 60
func enter():
	active_state = true
	emit_signal("state_entered","idle")

func exit(next_state):
	if active_state:
		active_state = false
		emit_signal("finished", next_state)

func update(delta):
	var direction = get_move_direction()
	if not direction:
		var velocity = Vector2(0, GRAVITY_FORCE)
		owner.move_and_slide(velocity, FLOOR_NORMAL, MAX_ANGLE_SLOPE)
	else:
		exit("Move")
	if not on_floor_ray_right.is_colliding() and not on_floor_ray_left.is_colliding():
		exit("Fall")