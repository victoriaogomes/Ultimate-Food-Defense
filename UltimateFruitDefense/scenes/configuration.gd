extends Node2D

#Script "Global", carregado por todas as cenas

#Variáveis para as configurações do jogo: idioma, efeitos sonoros, música
var language_english
var sound_effects
var music

#Por default, coloca o idioma em português e os efeitos sonoros e a música ligados
func _ready():
	language_english = true
	sound_effects = true
	music = true


#Altera o idioma do jogo para português
func port():
	language_english = false


#Altera o idioma do jogo para inglês
func engli():
	language_english = true


#Liga os efeitos sonoros do jogo
func sound_effects_on():
	sound_effects = true


#Desliga os efeitos sonoros do jogo
func sound_effects_off():
	sound_effects = false


#Liga a música do jogo
func music_on():
	music = true


#Desliga a música do jogo
func music_off():
	music = false