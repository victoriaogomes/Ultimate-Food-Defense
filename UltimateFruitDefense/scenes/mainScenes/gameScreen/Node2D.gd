extends Node2D

onready var enemies_types = [preload("res://scenes/mainScenes/gameScreen/pizza.tscn"), preload("res://scenes/mainScenes/gameScreen/soda.tscn"), preload("res://scenes/mainScenes/gameScreen/hamburguer.tscn")]
#warning-ignore:unused_class_variable
onready var glob = preload("res://scenes/mainScenes/gameScreen/Glob.tscn")
var mob
var waitTime = 1
#warning-ignore:unused_class_variable
var select
var type
var qnt
var aux

func _ready():
	self.set_physics_process(true)
	randomize()
	$MobTimer.start()
	#warning-ignore:return_value_discarded
	$MobTimer.connect("timeout", self, "on_Mob_TimeOut")


#warning-ignore:unused_argument
func _process(delta):
	aux = 20 + (game_control.level*2)
	if(game_control.beatedEnemies == aux):
		$MobTimer.stop()
		game_control.level = game_control.level+1
		game_control.beatedEnemies = 0
		game_control.avaliable = true
		get_node("../nextLevel").set_visible(true)
		get_node("../nextLevel/AnimationPlayer").play("nextLevel", -1, 1.0, false)
		get_tree().set_pause(true)
	elif (game_control.sugarLevel >=99):
		for i in range(0, get_child_count()):
    		get_child(i).queue_free()
		get_node("../loseScreen").set_visible(true)
		game_control.avaliable = true
		get_node("../loseScreen/AnimationPlayer").play("lose", -1, 1.0, false)
		get_tree().set_pause(true)
	else:
		qnt = get_tree().get_nodes_in_group("enemies").size()
		if(qnt==6):
			$MobTimer.stop()
		elif(qnt<6 || qnt==0):
			#print(qnt+game_control.beatedEnemies)
			if(qnt + game_control.beatedEnemies < aux):
				waitTime = 1
				if($MobTimer.is_stopped()):
					$MobTimer.start()
					waitTime = 1
			else:
				$MobTimer.stop()


func on_Mob_TimeOut():
	waitTime+=1
	$MobTimer.set_wait_time(waitTime)
	if(game_control.level == 1):
		type = randi()%2
	else:
		type = randi()%3
	mob = enemies_types[type].instance()
	mob.add_to_group("enemies")
	add_child(mob)