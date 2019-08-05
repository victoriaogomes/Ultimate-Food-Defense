extends Node2D

var youLose_port = preload("res://assets/sprites/loseScreen/texts/pt-Br/vocePerdeu.png")
var youLose_english = preload("res://assets/sprites/loseScreen/texts/english/youLose.png")

var ohNo_port = preload("res://assets/sprites/loseScreen/texts/pt-Br/ahNao.png")
var ohNo_english = preload("res://assets/sprites/loseScreen/texts/english/ohNo.png")

var tryAgainBase_port = preload("res://assets/sprites/loseScreen/texts/pt-Br/tentarDnv.png")
var tryAgainhover_port = preload("res://assets/sprites/loseScreen/texts/pt-Br/tentarDnv(v2).png")
var tryAgainBase_english = preload("res://assets/sprites/loseScreen/texts/english/TryLevelAgain.png")
var tryAgainhover_english = preload("res://assets/sprites/loseScreen/texts/english/TryLevelAgain(v2).png")

var mainMenuBase_english = preload("res://assets/sprites/pause/texts/english/mainMenu.png")
#warning-ignore:unused_class_variable
var mainMenuhover_english = preload("res://assets/sprites/pause/texts/english/mainMenu(v2).png")
var mainMenuBase_port = preload("res://assets/sprites/pause/texts/pt-Br/menuInicial.png")
var mainMenuhover_port = preload("res://assets/sprites/pause/texts/pt-Br/menuInicial(v2).png")


func _ready():
	language()
#warning-ignore:return_value_discarded
	configuration.connect("language_changed", self, "language")
	if(configuration.player_sex == "h"):
		var sickBoy = preload("res://assets/sprites/loseScreen/sickBoy.png")
		$sick.set_texture(sickBoy)
	else:
		var sickGirl = preload("res://assets/sprites/loseScreen/sickGirl.png")
		$sick.set_texture(sickGirl)


func language():
	if(configuration.language_english):
		$youLose.set_texture(youLose_english)
		$ohNo.set_texture(ohNo_english)
		$tryAgain.set_normal_texture(tryAgainBase_english)
		$tryAgain.set_hover_texture(tryAgainhover_english)
		$mainMenu.set_normal_texture(mainMenuBase_english)
		$mainMenu.set_hover_texture(mainMenuhover_english)
	else:
		$youLose.set_texture(youLose_port)
		$ohNo.set_texture(ohNo_port)
		$tryAgain.set_normal_texture(tryAgainBase_port)
		$tryAgain.set_hover_texture(tryAgainhover_port)
		$mainMenu.set_normal_texture(mainMenuBase_port)
		$mainMenu.set_hover_texture(mainMenuhover_port)


func _on_mainMenu_pressed():
	game_control.sugarLevel = 50
	game_control.target = null
	$AnimationPlayer.play_backwards("lose", -1)
	yield($AnimationPlayer, "animation_finished")
	#warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/mainScenes/titleScreen/titleScreen.tscn")


func _on_tryAgain_pressed():
	game_control.sugarLevel = 50
	#warning-ignore:return_value_discarded
	get_tree().reload_current_scene()
	get_tree().set_pause(false)
	game_control.target = null

func mouse_entered():
	if(configuration.sound_effects):
		configuration.mouseHover_sound.play()