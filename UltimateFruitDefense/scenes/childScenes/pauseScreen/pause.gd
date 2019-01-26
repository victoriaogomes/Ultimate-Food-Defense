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
var base_resumeGame_portuguese = preload("res://assets/sprites/pause/texts/pt-Br/voltarjogo.png")
var hover_resumeGame_portuguese = preload("res://assets/sprites/pause/texts/pt-Br/voltarjogo(v2).png")

func _ready():
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
	pass # replace with function body


#Mouse clicando no sprite "options"
func _on_options_pressed():
	pass # replace with function body


#Mouse clicando no sprite "resumeGame"
func _on_resumeGame_pressed():
		$AnimationPlayer.play_backwards("pause", -1)
		yield($AnimationPlayer, "animation_finished")
		get_tree().set_pause(false)