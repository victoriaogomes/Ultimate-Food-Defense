extends Node2D


func _on_pauseButton_pressed():
	$pause.set_visible(true)
	$pause/AnimationPlayer.play("pause", -1, 1.0, false)
	get_tree().set_pause(true)


func _on_pauseButton_mouse_entered():
	if(configuration.sound_effects):
		configuration.mouseHover_sound.play()
