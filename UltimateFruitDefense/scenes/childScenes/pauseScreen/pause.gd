extends Node2D

var base_options_english = preload("res://assets/sprites/pause/texts/english/Options.png")
var hover_options_english = preload("res://assets/sprites/pause/texts/english/Options(v2).png")
var base_options_portuguese = preload("res://assets/sprites/pause/texts/pt-Br/Opções.png")
var hover_options_portuguese = preload("res://assets/sprites/pause/texts/pt-Br/Opções(v2).png")

var base_mainMenu_english = preload("res://assets/sprites/pause/texts/english/mainMenu.png")
var hover_mainMenu_english = preload("res://assets/sprites/pause/texts/english/mainMenu(v2).png")
var base_mainMenu_portuguese = preload("res://assets/sprites/pause/texts/pt-Br/menuInicial.png")
var hover_mainMenu_portuguese = preload("res://assets/sprites/pause/texts/pt-Br/menuInicial(v2).png")

var base_resumeGame_english = preload("res://assets/sprites/pause/texts/english/resumeGame.png")
var hover_resumeGame_english = preload("res://assets/sprites/pause/texts/english/resumeGame(v2).png")
var base_resumeGame_portuguese = preload("res://assets/sprites/pause/texts/pt-Br/voltarJogo.png")
var hover_resumeGame_portuguese = preload("res://assets/sprites/pause/texts/pt-Br/voltarJogo(v2).png")

func _ready():
	language()
	configuration.connect("language_changed", self, "language")

func language():
	if(configuration.language_english):
		$box1/options.set_normal_texture(base_options_english)
		$box1/options.set_hover_texture(hover_options_english)
		$box1/mainMenu.set_normal_texture(base_mainMenu_english)
		$box1/mainMenu.set_hover_texture(hover_mainMenu_english)
		$box1/resumeGame.set_normal_texture(base_resumeGame_english)
		$box1/resumeGame.set_hover_texture(hover_resumeGame_english)
	else:
		$box1/options.set_normal_texture(base_options_portuguese)
		$box1/options.set_hover_texture(hover_options_portuguese)
		$box1/mainMenu.set_normal_texture(base_mainMenu_portuguese)
		$box1/mainMenu.set_hover_texture(hover_mainMenu_portuguese)
		$box1/resumeGame.set_normal_texture(base_resumeGame_portuguese)
		$box1/resumeGame.set_hover_texture(hover_resumeGame_portuguese)

#Mouse clicando no sprite "mainMenu"
func _on_mainMenu_pressed():
	$AnimationPlayer.play_backwards("pause", -1)
	yield($AnimationPlayer, "animation_finished")
	get_tree().change_scene("res://scenes/mainScenes/titleScreen/titleScreen.tscn")


func _on_mainMenu_mouse_entered():
	if(configuration.sound_effects):
		configuration.mouseHover_sound.play()


#Mouse clicando no sprite "options"
func _on_options_pressed():
	$options.set_visible(true)
	$black_background.set_visible(false)
	$white_background.set_visible(false)
	$box1.set_visible(false)
	$options/AnimationPlayer.play("options_configuration", -1, 1.0, false)
	yield($options/AnimationPlayer, "animation_finished")


func _on_options_mouse_entered():
	if(configuration.sound_effects):
		configuration.mouseHover_sound.play()


#Mouse clicando no sprite "resumeGame"
func _on_resumeGame_pressed():
		$AnimationPlayer.play_backwards("pause", -1)
		yield($AnimationPlayer, "animation_finished")
		get_node("/root/Node2D/pause").set_visible(false)
		get_tree().set_pause(false)


func _on_resumeGame_mouse_entered():
	if(configuration.sound_effects):
		configuration.mouseHover_sound.play()
