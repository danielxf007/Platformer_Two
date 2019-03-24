extends "res://character/body_state_machine/state_machine.gd"

func _ready():
	states_map = {
		"Idle" : $Idle,
		"Move" : $Move,
		"Jump" : $Jump,
		"Fall" : $Fall,
		"MeleAttack": $MeleAttack
	}

func _change_state(state_name):
	if not _active:
		return
	if state_name in ["Jump", "Fall", "MeleAttack"]:
		var state = states_map[state_name]
		if states_stack[0].HIERARCHY == state.HIERARCHY:
			states_stack.pop_front()
		states_stack.push_front(null)
	._change_state(state_name)