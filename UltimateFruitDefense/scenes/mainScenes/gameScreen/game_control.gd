extends Node2D

var target
var beatedEnemies = 0
var level = 1
var vitamins = 0
var sugarLevel = 50
var dano = 2
var wait_time = 2
var avaliable = true
signal sugarLevelChange

func aumentarSugarLevel():
	sugarLevel += dano
	emit_signal("sugarLevelChange")


func diminuirSugarLevel():
	if(sugarLevel>50):
		print("toqui")
		sugarLevel -=2
		emit_signal("sugarLevelChange")