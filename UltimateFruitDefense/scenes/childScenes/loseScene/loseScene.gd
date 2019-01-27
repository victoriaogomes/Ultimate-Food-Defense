extends Node2D

var youLose_port = preload("res://assets/sprites/loseScreen/texts/pt-Br/vocePerdeu.png")
var youLose_english = preload("res://assets/sprites/loseScreen/texts/english/you lose.png")
var ohNo_port = preload("res://assets/sprites/loseScreen/texts/pt-Br/ah nao.png")
var ohNo_english = preload("res://assets/sprites/loseScreen/texts/english/oh no.png")
var sickGirl = preload("res://assets/sprites/loseScreen/sickGirl.png")
var sickBoy = preload("res://assets/sprites/loseScreen/sickBoy.png")

func _ready():
	language()
	configuration.connect("language_changed", self, "language")
	if(configuration.player_sex == "m"):
		$sick.set_texture(sickBoy)
	else:
		$sick.set_texture(sickGirl)


func language():
	if(configuration.language_english):
		$youLose.set_texture(youLose_english)
		$ohNo.set_texture(ohNo_english)
	else:
		$youLose.set_texture(youLose_port)
		$ohNo.set_texture(ohNo_port)

func _on_mainMenu_pressed():
	$AnimationPlayer.play_backwards("lose", -1)
	yield($AnimationPlayer, "animation_finished")
	get_tree().change_scene("res://scenes/mainScenes/titleScreen/titleScreen.tscn")


func _on_mainMenu_mouse_entered():
	if(configuration.sound_effects):
		configuration.mouseHover_sound.play()
