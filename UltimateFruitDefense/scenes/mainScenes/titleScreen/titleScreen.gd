extends Node2D


func _ready():
	configuration.player.volume_db = -20
	get_tree().set_pause(false)
	if(configuration.music):
		if(!configuration.player.playing):
			configuration.player.play()
	if(animationControl.firstTitleScreen_run == true):
		$AnimationPlayer.play("car_intro", -1, 1.0, false)
	$AnimationPlayer2.play("clouds_moving", -1, 1.0, false)
	animationControl.firstTitleScreen_run = false