extends "res://character/body_state_machine/states/state.gd"
const FLOOR_NORMAL = Vector2(0, -1)
export(float) var  GRAVITY_FORCE = 300.0
var vertical_speed = 0.0

func enter():
	active_state = true
	emit_signal("state_entered","mele_attack")

func exit(next_state):
	if active_state:
		active_state = false
		emit_signal("finished", next_state)

func update(delta):
	calculate_v_speed(delta)
	var velocity = Vector2(0, vertical_speed)
	owner.move_and_slide(velocity, FLOOR_NORMAL)

func calculate_v_speed(delta):
	vertical_speed += GRAVITY_FORCE * delta

func _on_AnimationHandler_animation_finished():
	vertical_speed = 0.0
	exit("Previous")