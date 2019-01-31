extends Node2D

#Carregando cenas das frutas
onready var fruit1 = preload("res://scenes/mainScenes/gameScreen/Lemon.tscn")
onready var fruit2 = preload("res://scenes/mainScenes/gameScreen/strawberry.tscn")
onready var fruit3 = preload("res://scenes/mainScenes/gameScreen/grape.tscn")


#Conecta ao sinal que é emitido quando o nível de açúcar no 
#sangue altera
func _ready():
	game_control.connect("sugarLevelChange", self, "changeLabel")


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
	var lemon = fruit1.instance()
	add_child(lemon)
	game_control.diminuirSugarLevel()


#Função chamada quando o mouse entra no sprite do limão
func _on_lemon_mouse_entered():
	if(configuration.sound_effects):
		configuration.mouseHover_sound.play()


#Função chamada quando o morango é pressionado
func _on_strawberry_pressed():
	var sberry = fruit2.instance()
	add_child(sberry)


#Função chamada quando o mouse entra no sprite do morango
func _on_strawberry_mouse_entered():
	if(configuration.sound_effects):
		configuration.mouseHover_sound.play()


#Função chamada quando a uva é pressionada
func _on_grape_pressed():
	var grape =  fruit3.instance()
	add_child(grape)


#Função chamada quando o mouse entra no sprite da uva
func _on_grape_mouse_entered():
	if(configuration.sound_effects):
		configuration.mouseHover_sound.play()