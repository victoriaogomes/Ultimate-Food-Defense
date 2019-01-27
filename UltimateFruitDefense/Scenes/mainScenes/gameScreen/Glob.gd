extends Node2D

var enemies = []
var numberEnemies = 0
onready var node = get_node("gameControl")
onready var bullet = preload("res://scenes/mainScenes/gameScreen/bullet.tscn")

func _ready():
	self.set_physics_process(true)


func _process(delta):
	find_enemies()
	swap_animation(delta)

func find_enemies():

	var i = 0
	while i<3:
		var j =0
		while j<5:
			if node.line1_enemies[i][j] != null:
				enemies[numberEnemies] = node.line1_enemies[i][j]
				numberEnemies+=1
			j+=1
		i+=1
	i = 0
	while i<3:
		var j =0
		while j<5:
			if node.line2_enemies[i][j] != null:
				enemies[numberEnemies] = node.line2_enemies[i][j]
				numberEnemies+=1
			j+=1
		i+=1
	i = 0
	while i<3:
		var j =0
		while j<5:
			if node.line3_enemies[i][j] != null:
				enemies[numberEnemies] = node.line3_enemies[i][j]
				numberEnemies+=1
			j+=1
		i+=1
	i = 0
	while i<3:
		var j =0
		while j<5:
			if node.line4_enemies[i][j] != null:
				enemies[numberEnemies] = node.line4_enemies[i][j]
				numberEnemies+=1
			j+=1
		i+=1
	i = 0
	while i<3:
		var j =0
		while j<5:
			if node.line5_enemies[i][j] != null:
				enemies[numberEnemies] = node.line5_enemies[i][j]
				numberEnemies+=1
			j+=1
		i+=1
	choose_and_lock()
	numberEnemies = 0

#acha o melhor inimigo e passa a instâcia dele para um variável no outro script
func choose_and_lock():
	#if enemies[0] != 0:
	node.target = enemies[0]
	var i = 1
	while i < enemies.size():
		if node.target.position.x > enemies[i].position.x:
			node.target = enemies[1]
		i+=1
	
func swap_animation(delta):
	if node.target != null:
		print("tem inimigo")
		var anim
		var pos
		var target_position = node.target.position
		if target_position.y < -111:
			if target_position.x <-91:
				anim = "shootUp2"
				pos = $PositionUp2
			else:
				anim = "shootUp1"
				pos = $PositionUp1
		elif target_position.y < -48 && target_position > -91:
			anim = "shootCenter"
			pos = $PositionCenter
		elif target_position.y < 1.8 && target_position > -48:
			if target_position.x < -94:
				anim = "shootDown1"
				pos = $PositionDown1
			else:
				anim = "shootCenter"
				pos = $PositionCenter
		elif target_position.y < 60 && target_position.y > 1.8:
			if target_position.x < -170:
				anim = "shootDown2"
				pos = $PositionDown2
			else:
				anim = "shootDown1"
				pos = $PositionDown1
		elif target_position.y > 60:
			if target_position.x < -58:
				anim = "shootDown2"
				pos = $PositionDown2
			else:
				anim = "shootDown1"
				pos = $PositionDown1
		$AnimatedSprite.play(anim)
		spwan_bullet(pos)
	else:
		print("n tem inimigo!")
		$AnimatedSprite.play("idle")

func spwan_bullet(pos):
	var clone_bullet = bullet.instance()
	get_parent().add_child(clone_bullet)
	clone_bullet.position = pos.global_position