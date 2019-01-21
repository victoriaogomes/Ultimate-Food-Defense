extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
"res://Scenes/gameScreen/Mob.tscn"
export (PackedScene) var Mob
var score


func _ready():
	randomize()
	$MobTimer.start()
	on_Mob_TimeOut()
	pass

func on_Mob_TimeOut():
	# choose a random location on Path2D
    
    # create a Mob instance and add it to the scene
    var mob = Mob.instance()
    add_child(mob)
    # set the mob's position to a random location
    mob.position = $MobPath/MobSpawnLocation.set_offset(randi())
