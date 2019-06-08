extends Node2D

#warning-ignore:unused_class_variable
var target
#warning-ignore:unused_class_variable
var beatedEnemies = 0
#warning-ignore:unused_class_variable
var level = 1
#warning-ignore:unused_class_variable
var vitamins = 0
var sugarLevel = 50
var dano = 2
#warning-ignore:unused_class_variable
var wait_time = 2
#warning-ignore:unused_class_variable
var avaliable = true
signal sugarLevelChange

func aumentarSugarLevel():
	sugarLevel += dano
	print("chegueeei")
	emit_signal("sugarLevelChange")


func diminuirSugarLevel():
	if(sugarLevel>=52):
		print("toqui")
		sugarLevel -=2
		emit_signal("sugarLevelChange")