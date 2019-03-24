extends Node
signal finished (next_state)
signal state_entered(animation_name)

export(int) var HIERARCHY = 0
var active_state = false


func enter():
	return

func exit(next_state):
	return

func update(delta):
	return