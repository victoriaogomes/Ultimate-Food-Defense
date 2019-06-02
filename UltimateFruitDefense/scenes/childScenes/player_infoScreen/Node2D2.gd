extends Node2D

var base_port_start = preload("res://assets/sprites/player_infoScreen/Texts/Pt-Br/Iniciar.png")
var hover_port_start = preload("res://assets/sprites/player_infoScreen/Texts/Pt-Br/Iniciar(v2).png")
var base_port_beforeStart = preload("res://assets/sprites/player_infoScreen/Texts/Pt-Br/Antes de começarmos.png")
var base_port_myName = preload("res://assets/sprites/player_infoScreen/Texts/Pt-Br/Meu nome é.png")
var base_port_iAm = preload("res://assets/sprites/player_infoScreen/Texts/Pt-Br/Eu sou.png")

var base_engli_start = preload("res://assets/sprites/player_infoScreen/Texts/English/Start.png")
var hover_engli_start = preload("res://assets/sprites/player_infoScreen/Texts/English/Start(v2).png")
var base_engli_beforeStart = preload("res://assets/sprites/player_infoScreen/Texts/English/Before we start.png")
var base_engli_myName = preload("res://assets/sprites/player_infoScreen/Texts/English/My name is.png")
var base_engli_iAm = preload("res://assets/sprites/player_infoScreen/Texts/English/I am a.png")

#warning-ignore:unused_class_variable
var base_english_sprite = preload("res://assets/sprites/player_infoScreen/Texts/English/Start.png")
#warning-ignore:unused_class_variable
var hover_english_sprite = preload("res://assets/sprites/player_infoScreen/Texts/English/Start(v2).png")
#warning-ignore:unused_class_variable
var base_port_sprite = preload("res://assets/sprites/player_infoScreen/Texts/Pt-Br/Iniciar.png")
#warning-ignore:unused_class_variable
var hover_port_sprite = preload("res://assets/sprites/player_infoScreen/Texts/Pt-Br/Iniciar(v2).png")
var next_scene = preload("res://scenes/mainScenes/gameScreen/game.tscn")

func _ready():
	language()
#warning-ignore:return_value_discarded
	configuration.connect("language_changed", self, "language")
	$"my name is/TextEdit".cursor_set_blink_enabled(true)

func language():
	if(configuration.language_english):
		$start.set_normal_texture(base_engli_start)
		$start.set_hover_texture(hover_engli_start)
		$"before we start".set_texture(base_engli_beforeStart)
		$"my name is".set_texture(base_engli_myName)
		$"i am a".set_texture(base_engli_iAm)
		$ConfirmationDialog.set_text("Plese, make sure to informe your name and sex before start.")
	else:
		$start.set_normal_texture(base_port_start)
		$start.set_hover_texture(hover_port_start)
		$"before we start".set_texture(base_port_beforeStart)
		$"my name is".set_texture(base_port_myName)
		$"i am a".set_texture(base_port_iAm)
		$ConfirmationDialog.set_text("Por favor, certifique-se de informar seu nome e sexo antes de começar.")

func _on_start_pressed():
	configuration.player_name = $"my name is/TextEdit".get_text()
	if(configuration.player_name == null):
		$ConfirmationDialog.popup_centered()
	elif(configuration.player_sex == null):
		$ConfirmationDialog.popup_centered()
	else:
		$AnimationPlayer.play_backwards("info_player", -1)
		configuration.player_name = $"my name is/TextEdit".get_text()
		yield($AnimationPlayer, "animation_finished")
		get_node("/root/Node2D/AnimationPlayer").play("car_leaving", -1, 1.0, false)
		yield(get_node("/root/Node2D/AnimationPlayer"), "animation_finished")
#warning-ignore:return_value_discarded
		get_tree().change_scene_to(next_scene)
