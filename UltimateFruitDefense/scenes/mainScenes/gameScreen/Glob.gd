extends Node2D

var enemies
var numberEnemies = 0
var anim
var pos
var target_position
onready var bullet = preload("res://scenes/mainScenes/gameScreen/bullet.tscn")


func _ready():
	self.set_physics_process(true)
	$timer.start()
	$timer.connect("timeout", self, "on_TimeOut")


func on_TimeOut():
	if(game_control.target!=null):
		spwan_bullet(pos)


func _process(delta):
	choose_and_lock()
	swap_animation(delta)


#acha o melhor inimigo e passa a instâcia dele para um variável no outro script
func choose_and_lock():
	if(get_tree().get_nodes_in_group("enemies").size()>0):
		enemies = get_tree().get_nodes_in_group("enemies")
		game_control.target = enemies[0]
		var i = 1
		while i < enemies.size():
			if game_control.target.position.x > enemies[i].position.x:
				game_control.target = enemies[1]
			i+=1


func swap_animation(delta):
	if game_control.target != null:
		target_position = game_control.target.position
		if target_position.y < -111:
			if target_position.x <-91:
				anim = "shootUp2"
				pos = get_node("/root/Node2D/PositionUp2")
			else:
				anim = "shootUp1"
				pos = get_node("/root/Node2D/PositionUp1")
		elif target_position.y < -48 && target_position.y > -91:
			anim = "shootCenter"
			pos = get_node("/root/Node2D/PositionCenter")
		elif target_position.y < 1.8 && target_position.y > -48:
			if target_position.x < -94:
				anim = "shootDown1"
				pos = get_node("/root/Node2D/PositionDown1")
			else:
				anim = "shootCenter"
				pos = get_node("/root/Node2D/PositionCenter")
		elif target_position.y < 60 && target_position.y > 1.8:
			if target_position.x < -170:
				anim = "shootDown2"
				pos = get_node("/root/Node2D/PositionDown2")
			else:
				anim = "shootDown1"
				pos = get_node("/root/Node2D/PositionDown1")
		elif target_position.y > 60:
			if target_position.x < -58:
				anim = "shootDown2"
				pos = get_node("/root/Node2D/PositionDown2")
			else:
				anim = "shootDown1"
				pos = get_node("/root/Node2D/PositionDown1")
		$AnimatedSprite.play(anim)
	else:
		$AnimatedSprite.play("idle")


func spwan_bullet(pos):
	var clone_bullet = bullet.instance()
	get_parent().add_child(clone_bullet)
	clone_bullet.add_to_group("bullet")
	clone_bullet.position = pos.position