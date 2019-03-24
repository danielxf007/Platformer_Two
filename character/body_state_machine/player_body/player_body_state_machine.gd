extends "res://character/body_state_machine/state_machine.gd"

func _ready():
	states_map = {
		"Idle" : $Idle,
		"Move" : $Move,
		"Jump" : $Jump,
		"Fall" : $Fall
	}

func _change_state(state_name):
	if not _active:
		return
	if state_name in ["Jump", "Fall"]:
		states_stack.push_front(null)
	._change_state(state_name)