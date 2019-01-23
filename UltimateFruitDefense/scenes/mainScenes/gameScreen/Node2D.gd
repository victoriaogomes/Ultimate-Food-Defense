extends Node2D

#onready var Mob = preload("res://scenes/mainScenes/gameScreen/Burguer.tscn")
onready var enemies_types = [preload("res://scenes/mainScenes/gameScreen/burguer.tscn"), preload("res://scenes/mainScenes/gameScreen/pizza.tscn"), preload("res://scenes/mainScenes/gameScreen/soda.tscn")]

var score
var mob
var waitTime
var select


func _ready():
	waitTime = 1
	randomize()
	$MobTimer.start()
	$MobTimer.connect("timeout", self, "on_Mob_TimeOut")


func on_Mob_TimeOut():
		waitTime+=1
		$MobTimer.set_wait_time(waitTime)
		mob = enemies_types[randi()%3].instance()
		add_child(mob)
		#yield($MobTimer.start(5.0), "timeout")