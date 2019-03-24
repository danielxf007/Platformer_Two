extends "res://character/animation_handler/animation_handler.gd"


func play_animation(animation_name):
	$AnimationPlayer.play(animation_name)
