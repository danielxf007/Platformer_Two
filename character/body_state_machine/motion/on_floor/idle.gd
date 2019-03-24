extends "res://character/body_state_machine/motion/motion.gd"


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
		var velocity = Vector2(0, GRAVITY_FORCE * delta)
		owner.move_and_slide(velocity, FLOOR_NORMAL)
	else:
		exit("Move")