extends Node2D

onready var Mob = preload("res://scenes/mainScenes/gameScreen/Burguer.tscn")

var score
var mob
var waitTime


func _ready():
	waitTime = 1
	randomize()
	$MobTimer.start()
	$MobTimer.connect("timeout", self, "on_Mob_TimeOut")


func on_Mob_TimeOut():
		waitTime+=1
		$MobTimer.set_wait_time(waitTime)
		mob = Mob.instance()
		add_child(mob)
		#yield($MobTimer.start(5.0), "timeout")