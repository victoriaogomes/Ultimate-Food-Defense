extends Node2D

var target
var beatedEnemies = 0
var level = 1
var vitamins = 0
var sugarLevel = 50
signal sugarLevelChange

func aumentarSugarLevel():
	sugarLevel +=2
	emit_signal("sugarLevelChange")