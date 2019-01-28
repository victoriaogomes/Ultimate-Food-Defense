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

#func find_enemies():
#	choose_and_lock()
#	var i
#	var j
#	print("oi")
#	i = 0
#	while i<3:
#		j = 0
#		while j<5:
#			if(node.line1_enemies[i].size()>0):
#				if node.line1_enemies[i][j] != null:
#					enemies[numberEnemies] = node.line1_enemies[i][j]
#					numberEnemies+=1
#				j+=1
#			else:
#				break
#		i+=1
#	i = 0
#	print("cabou while1")
#	while i<3:
#		j = 0
#		while j<5:
#			if(node.line2_enemies[i].size()>0):
#				if node.line2_enemies[i][j] != null:
#					enemies[numberEnemies] = node.line2_enemies[i][j]
#					numberEnemies+=1
#				j+=1
#		i+=1
#	i = 0
#	print("cabou while2")
#	while i<3:
#		j = 0
#		while j<5:
#			if(node.line3_enemies[i].size()>0):
#				if node.line3_enemies[i][j] != null:
#					enemies[numberEnemies] = node.line3_enemies[i][j]
#					numberEnemies+=1
#				j+=1
#		i+=1
#	i = 0
#	print("cabou while3")
#	while i<3:
#		j = 0
#		while j<5:
#			if(node.line4_enemies[i].size()>0):
#				if node.line4_enemies[i][j] != null:
#					enemies[numberEnemies] = node.line4_enemies[i][j]
#					numberEnemies+=1
#				j+=1
#		i+=1
#	i = 0
#	print("cabou while4")
#	while i<3:
#		j = 0
#		while j<5:
#			if(node.line5_enemies[i].size()>0):
#				if node.line5_enemies[i][j] != null:
#					enemies[numberEnemies] = node.line5_enemies[i][j]
#					numberEnemies+=1
#				j+=1
#		i+=1
#		choose_and_lock()
#		numberEnemies = 0
#	print("cabou while5")

#acha o melhor inimigo e passa a instâcia dele para um variável no outro script
func choose_and_lock():
	#if enemies[0] != 0:
	#print(game_control.enemies.size())
	if(game_control.enemies.size()>0):
		enemies = game_control.enemies
		game_control.target = enemies[0]
		var i = 1
		while i < enemies.size():
			if game_control.target.position.x > enemies[i].position.x:
				game_control.target = enemies[1]
			i+=1


func swap_animation(delta):
	if game_control.target != null:
		#print("tem inimigo")
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
		#spwan_bullet(pos)
	else:
		#print("n tem inimigo!")
		$AnimatedSprite.play("idle")

func spwan_bullet(pos):
	var clone_bullet = bullet.instance()
	get_parent().add_child(clone_bullet)
	clone_bullet.position = pos.position
	#print("adicionei uma")