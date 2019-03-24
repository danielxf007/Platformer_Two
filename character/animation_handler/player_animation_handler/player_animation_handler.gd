extends "res://character/animation_handler/animation_handler.gd"

var animation_data = preload("res://character/player/player_animation_data/player_animation_data.gd").new()

func play_animation(animation_name):
	if animation_name in animation_data.animations:
		$AnimationTime.wait_time = animation_data.animations_time[animation_name]
		$AnimationTime.start()
		$AnimationPlayer.play(animation_name)

func animation_time_out():
	emit_signal("animation_finished")