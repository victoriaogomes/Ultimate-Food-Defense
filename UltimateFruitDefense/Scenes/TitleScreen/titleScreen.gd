extends Node2D

onready var animation = get_node("/root/Node2D/AnimationPlayer")

func _ready():
	if(animationControl.firstTitleScreen_run == true):
		animation.play("car_intro", -1, 1.0, false)
	animationControl.firstTitleScreen_run = false
	if(configuration.music):
		if(!configuration.player.playing):
			configuration.player.play()