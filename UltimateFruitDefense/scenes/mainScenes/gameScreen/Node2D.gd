extends Node2D

#onready var Mob = preload("res://scenes/mainScenes/gameScreen/Burguer.tscn")
onready var enemies_types = [preload("res://scenes/mainScenes/gameScreen/pizza.tscn"), preload("res://scenes/mainScenes/gameScreen/burguer.tscn"), preload("res://scenes/mainScenes/gameScreen/soda.tscn")]
onready var glob = preload("res://Scenes/mainScenes/gameScreen/Glob.tscn")
onready var soldier = get_node("../Glob")
onready var game_control = get_node("../gameControl")

var score
var mob
var waitTime
var select
var quant
var type

func _ready():
	waitTime = 1
	randomize()
	$MobTimer.start()
	$MobTimer.connect("timeout", self, "on_Mob_TimeOut")


func on_Mob_TimeOut():
		waitTime+=1
		$MobTimer.set_wait_time(waitTime)
		type = randi()%3
		mob = enemies_types[type].instance()
		add_child(mob)
		game_control.add_enemie(mob, type, mob.select)
		#yield($MobTimer.start(5.0), "timeout")