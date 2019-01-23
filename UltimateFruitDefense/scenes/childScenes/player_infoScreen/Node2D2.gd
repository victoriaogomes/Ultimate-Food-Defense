extends Node2D

var base_port_start = preload("res://assets/sprites/player_infoScreen/Texts/Pt-Br/Iniciar.png")
var base_port_beforeStart = preload("res://assets/sprites/player_infoScreen/Texts/Pt-Br/Antes de começarmos.png")
var base_port_myName = preload("res://assets/sprites/player_infoScreen/Texts/Pt-Br/Meu nome é.png")
var base_port_iAm = preload("res://assets/sprites/player_infoScreen/Texts/Pt-Br/Eu sou.png")

func _ready():
	if(!configuration.language_english):
		$startStaticBody2D/start.set_texture(base_port_start)
		$"before we start".set_texture(base_port_beforeStart)
		$"my name is".set_texture(base_port_myName)
		$"i am a".set_texture(base_port_iAm)