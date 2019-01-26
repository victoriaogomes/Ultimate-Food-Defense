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

func _ready():
	language()
	configuration.connect("language_changed", self, "language")

func language():
	if(configuration.language_english):
		$start.set_normal_texture(base_engli_start)
		$start.set_hover_texture(hover_engli_start)
		$"before we start".set_texture(base_engli_beforeStart)
		$"my name is".set_texture(base_engli_myName)
		$"i am a".set_texture(base_engli_iAm)
	else:
		$start.set_normal_texture(base_port_start)
		$start.set_hover_texture(hover_port_start)
		$"before we start".set_texture(base_port_beforeStart)
		$"my name is".set_texture(base_port_myName)
		$"i am a".set_texture(base_port_iAm)