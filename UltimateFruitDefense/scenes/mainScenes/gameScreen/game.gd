extends Node2D

#Carregando cenas das frutas
onready var fruit1 = preload("res://scenes/mainScenes/gameScreen/Lemon.tscn")
onready var fruit2 = preload("res://scenes/mainScenes/gameScreen/strawberry.tscn")
onready var fruit3 = preload("res://scenes/mainScenes/gameScreen/grape.tscn")
onready var PowerUp = preload("res://scenes/mainScenes/gameScreen/PowerUp.tscn")
var vitamins = 180

#Conecta ao sinal que é emitido quando o nível de açúcar no sangue altera
func _ready():
	configuration.player.volume_db = -23
	self.set_physics_process(true)
	#warning-ignore:return_value_discarded
	game_control.connect("sugarLevelChange", self, "changeLabel")


func _process(delta):
	if vitamins >=100:
		enable_fruits()
	else:
		disable_fruits()
	vitamins = vitamins + delta*2
	#print(vitamins)
	$Label2.text = str(int(vitamins))


#Função chamada para modificar o valor da glicemia mostrado
func changeLabel():
	$Label.text = str(game_control.sugarLevel, " mg/dL")


#Função chamada quando o botão de pause é pressionado
func _on_pauseButton_pressed():
	$pause.set_visible(true)
	$pause/AnimationPlayer.play("pause", -1, 1.0, false)
	get_tree().set_pause(true)


#Função chamada quando o mouse entra no botão de pause
func _on_pauseButton_mouse_entered():
	if(configuration.sound_effects):
		configuration.mouseHover_sound.play()


#Função chamada quando o limão é pressionado
func _on_lemon_pressed():
	if vitamins >= 100:
		vitamins-=100
		var lemon = fruit1.instance()
		add_child(lemon)
		game_control.dano = 1
		powerUp(Vector2(320.532, 410.79), "+ Aumento da Pectina")
		powerUp(Vector2(320.532, 430.79), "+ Absorção de açúcar reduzida")
		powerUp(Vector2(320.532, 450.79), "+ INIMIGOS ESTÃO MAIS LENTOS!")


#Função chamada quando o mouse entra no sprite do limão
func _on_lemon_mouse_entered():
	if(configuration.sound_effects):
		configuration.mouseHover_sound.play()


#Função chamada quando o morango é pressionado
func _on_strawberry_pressed():
	if vitamins >= 100:
		vitamins-=100
		var sberry = fruit2.instance()
		add_child(sberry)
		game_control.diminuirSugarLevel()
		powerUp(Vector2(420.532, 410.79), "+ Aumento da Antocianina")
		powerUp(Vector2(420.532, 430.79), "+ Aumento de insulina no sangue")
		powerUp(Vector2(420.532, 450.79), "- NÍVEL DE GLICOSE REDUZIDO!")


#Função chamada quando o mouse entra no sprite do morango
func _on_strawberry_mouse_entered():
	if(configuration.sound_effects):
		configuration.mouseHover_sound.play()


#Função chamada quando a uva é pressionada
func _on_grape_pressed():
	if vitamins >=100:
		vitamins-=100
		var grape =  fruit3.instance()
		add_child(grape)
		game_control.wait_time = 1
		powerUp(Vector2(520.532, 410.79), "+ Aumento de Resveratrol")
		powerUp(Vector2(520.532, 430.79), "+ Células mais sensíveis a insulina")
		powerUp(Vector2(520.532, 450.79), "+ VELOCIDADE DE ATAQUE AUMENTADA!")

func enable_fruits():
	$lemon.disabled = false
	$strawberry.disabled = false
	$grape.disabled = false


func disable_fruits():
	$lemon.disabled = true
	$strawberry.disabled = true
	$grape.disabled = true
	

#Função chamada quando o mouse entra no sprite da uva
func _on_grape_mouse_entered():
	if(configuration.sound_effects):
		configuration.mouseHover_sound.play()

func powerUp(position, text):
	var power = PowerUp.instance()
	get_parent().add_child(power)
	power.prepar(position, text)
	game_control.wait_time = 1


