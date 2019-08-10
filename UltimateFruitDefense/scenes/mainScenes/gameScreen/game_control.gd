extends Node2D

#warning-ignore:unused_class_variable
var target
#warning-ignore:unused_class_variable
var beatedEnemies = 0 #Variável que armazena quantos inimigos já foram abatidos
#warning-ignore:unused_class_variable
var level = 1 #Variável que armazena o nível no qual o jogador se encontra
#warning-ignore:unused_class_variable
var vitamins = 0 #Variável que armazena quantas vitaminas o jogador tem
var sugarLevel = 50 #Variável que armazena o nível de açúcar do jogador
var dano = 2
#warning-ignore:unused_class_variable
var wait_time = 0.6 #Tempo que deve ser esperado para permitir que o glob atire novamente
#warning-ignore:unused_class_variable
var avaliable = true
signal sugarLevelChange #Sinal que indica mudança no nível de açúcar do corpo do jogador
signal shotSomeone

#Função para aumentar o nível de açúcar no sangue do jogador
func aumentarSugarLevel():
	sugarLevel += dano #Soma o nível de açúcar com o dano recebido
	emit_signal("sugarLevelChange") #Emite um sinal informando que o nível de açúcar mudou

#Função para diminuir o nível de açúcar no sangue do jogador
func diminuirSugarLevel():
	if(sugarLevel>=52):
		sugarLevel -=2#Substrai 2 do nível de açúcar
		emit_signal("sugarLevelChange")#Emite um sinal informando que o nível de açúcar mudou


func _shot():
	emit_signal("shotSomeone")