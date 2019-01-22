extends Node2D

onready var start = get_node("startStaticBody2D/start")
onready var before_start = get_node("before we start")
onready var my_name = get_node("my name is")
onready var animation = get_node("AnimationPlayer")
onready var im_a = get_node("i am a")
var base_port_start = preload("res://assets/sprites/player_infoScreen/Texts/Pt-Br/Iniciar.png")
var base_port_beforeStart = preload("res://assets/sprites/player_infoScreen/Texts/Pt-Br/Antes de começarmos.png")
var base_port_myName = preload("res://assets/sprites/player_infoScreen/Texts/Pt-Br/Meu nome é.png")
var base_port_iAm = preload("res://assets/sprites/player_infoScreen/Texts/Pt-Br/Eu sou.png")

func _ready():
	if(!configuration.language_english):
		start.set_texture(base_port_start)
		before_start.set_texture(base_port_beforeStart)
		my_name.set_texture(base_port_myName)
		im_a.set_texture(base_port_iAm)