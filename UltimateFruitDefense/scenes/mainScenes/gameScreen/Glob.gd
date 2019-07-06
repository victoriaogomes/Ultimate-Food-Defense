extends Node2D

var enemies
#warning-ignore:unused_class_variable
var numberEnemies = 0
var anim
var pos
var target_position
var motion = Vector2()

onready var bullet = preload("res://scenes/mainScenes/gameScreen/bullet.tscn")


func _ready():
	self.set_physics_process(true)
	$timer.start()
	#warning-ignore:return_value_discarded
	$timer.connect("timeout", self, "on_TimeOut")
	#warning-ignore:return_value_discarded
	$tempo.connect("timeout", self, "_on_tempo_timeout")



func on_TimeOut():
	if(game_control.target!=null):
		spwan_bullet(pos)


func _process(delta):
	set_wait_time(game_control.wait_time)
	choose_and_lock()
	swap_animation(delta)

func _physics_process(delta):
	if Input.is_action_pressed("ui_down"):
		motion.y = -100
	elif Input.is_action_pressed("ui_up"):
		motion.y = 100
	$globBody.move_and_slide(motion)

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

func set_wait_time(time):
	$timer.wait_time = time
	if game_control.avaliable && time == 1:
		$tempo.start()
		game_control.avaliable = false
	
#warning-ignore:unused_argument

#Função Que troca a animação do Glóbulo baseada na posição do inimigo
func swap_animation(delta):
	if game_control.target != null: #Se houver um inimigo
		target_position = game_control.target.position #Captura a posicação do inimigo
		#Verifica qual são as coordenadas do inimigo para decidir qual o melhor ângulo de sprite para atirar
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
	else: #Se não houver inimigos ele mantém o sprite principal
		$AnimatedSprite.play("idle")

#Função que cria o objeto bullet (projétil do jogo)
func spwan_bullet(pos):
	var clone_bullet = bullet.instance()
	get_parent().add_child(clone_bullet)
	clone_bullet.add_to_group("bullet")
	clone_bullet.position = pos.position
	if(configuration.sound_effects):
		configuration.gun_sound.play()

func _on_tempo_timeout():
	game_control.wait_time = 2
	game_control.avaliable = true
