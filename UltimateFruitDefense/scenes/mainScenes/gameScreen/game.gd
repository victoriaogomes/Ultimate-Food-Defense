extends Node2D

onready var fruit1 = preload("res://scenes/mainScenes/gameScreen/Lemon.tscn")
onready var fruit2 = preload("res://scenes/mainScenes/gameScreen/strawberry.tscn")
onready var fruit3 = preload("res://scenes/mainScenes/gameScreen/grape.tscn")

func _ready():
	game_control.connect("sugarLevelChange", self, "changeLabel")

func _on_pauseButton_pressed():
	$pause.set_visible(true)
	$pause/AnimationPlayer.play("pause", -1, 1.0, false)
	get_tree().set_pause(true)

func changeLabel():
	$Label.text = str(game_control.sugarLevel, " mg/dL")


func _on_pauseButton_mouse_entered():
	if(configuration.sound_effects):
		configuration.mouseHover_sound.play()

func _on_lemon_mouse_entered():
	#if Input.is_action_just_pressed("ui_mouse_left_button"):
	var lemon = fruit1.instance()
	add_child(lemon)
	print("lemon created")
		


func _on_strawberry_mouse_entered():
	var sberry = fruit2.instance()
	add_child(sberry)
	print("strawberry created")


func _on_grape_mouse_entered():
	var grape =  fruit3.instance()
	add_child(grape)
	print("grape created")
