extends Node2D

onready var animation = get_node("/root/Node2D/AnimationPlayer")
onready var animation2 = get_node("/root/Node2D/AnimationPlayer2")

func _ready():
	if(configuration.music):
		if(!configuration.player.playing):
			configuration.player.play()
	if(animationControl.firstTitleScreen_run == true):
		animation.play("car_intro", -1, 1.0, false)
	animation2.play("clouds_moving", -1, 1.0, false)
	animationControl.firstTitleScreen_run = false