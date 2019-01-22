extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
onready var Mob = preload("res://scenes/mainScenes/gameScreen/Mob.tscn")
#export (PackedScene) var Mob
var score


func _ready():
	randomize()
	$MobTimer.start()
	$MobTimer.connect("timeout", self, "on_Mob_TimeOut")
	pass

func on_Mob_TimeOut():
	# choose a random location on Path2D
    #$MobPath/MobSpawnLocation.set_offset(randi())
    # create a Mob instance and add it to the scene
    var mob = Mob.instance()
    add_child(mob)
    # set the mob's position to a random location
    #mob.position = $MobPath/MobSpawnLocation.position