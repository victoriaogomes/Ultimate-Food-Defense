extends KinematicBody2D

#warning-ignore:unused_class_variable
var enemies
#warning-ignore:unused_class_variable
var numberEnemies = 0
var anim
var pos
#warning-ignore:unused_class_variable
var target_position
var motion = Vector2()

onready var bullet = preload("res://scenes/mainScenes/gameScreen/bullet.tscn")


func _ready():
	self.set_physics_process(true)
	#warning-ignore:return_value_discarded
	$tempo.connect("timeout", self, "_on_tempo_timeout")


func _physics_process(delta): #a todo frame essa função fica esperando os comandos para fazer o personagem se mecher
	var temp = get_node("/root/Node2D/Glob")
	if Input.is_action_pressed("ui_down") || get_node("/root/Node2D/down").is_pressed(): # Se precionar seta direcionar para baixo
		if temp.position.y < 5.87 :
			motion.y = 100 # Vetor movimento do globulo recebe 100 para ele descer no plano
		else: # Caso contrário
			motion.y = 0 # Vetor movimento é igual a zero, Glóbulo parado
	elif Input.is_action_pressed("ui_up") || get_node("/root/Node2D/up").is_pressed(): # Se precionar seta direcionar para cima
		if temp.position.y > -24.429:
			motion.y = -100 # Vetor movimento do glóbulo recebe -100 e sobe no plano
		else: # Caso contrário
			motion.y = 0 # Vetor movimento é igual a zero, Glóbulo parado
	else:
		motion.y = 0
	move_and_slide(motion*(delta*40)) # Função nativa do godot para movimentar
	if Input.is_action_pressed("Space"):
		_on_shot_pressed()


func set_wait_time(time):
	$tempo.wait_time = time
	#if game_control.avaliable && time == 1:
	$tempo.start()
	game_control.avaliable = false


#warning-ignore:unused_argument
#Função Que troca a animação do Glóbulo baseada na posição do inimigo
func swap_animation():
	if game_control.target != null: #Se houver um inimigo
		anim = "shootCenter"
	else: #Se não houver inimigos ele mantém o sprite principal
		$AnimatedSprite.play("idle")


#Função que cria o objeto bullet (projétil do jogo)
func spwan_bullet(pos):
	var clone_bullet = bullet.instance() # Cria um instância da scena de bullet
	get_parent().add_child(clone_bullet) # Add o clone como nó filho
	clone_bullet.add_to_group("bullet") # Add ao grupo bullet para o comportamento
	clone_bullet.position.x = pos.position.x + 4.44 # Nesse ponto o projétil recebe a posição do
	clone_bullet.position.y = pos.position.y + 4.462 # Glóbulo e ajusta para a ponta da arma
	if(configuration.sound_effects): #Verifica se nas configurações o som está ativado
		configuration.gun_sound.play() # Som do lançamento do projétil


func _on_tempo_timeout():
	game_control.avaliable = true

func _on_shot_pressed():
	if(game_control.avaliable == true):
		set_wait_time(game_control.wait_time)
		swap_animation()
		pos = get_node("/root/Node2D/Glob") #Pega a posição atual do Glóbulo
		spwan_bullet(pos) # Essa posição é usada como referência para o spawn do projétil