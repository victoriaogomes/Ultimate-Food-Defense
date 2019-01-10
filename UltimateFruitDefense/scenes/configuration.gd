extends Node2D

#Script "Global", carregado por todas as cenas

#Variáveis para as configurações do jogo: idioma, efeitos sonoros, música
var language_english
var music
var sound_effects
var player = AudioStreamPlayer.new()
var mouseHover_sound = AudioStreamPlayer.new()


#Por default, coloca o idioma em português e os efeitos sonoros e a música ligados
func _ready():
	language_english = true
	sound_effects = true
	music = true
	playSong()
	mouseHover_effect()


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
	player.play()


#Desliga a música do jogo
func music_off():
	music = false
	player.stop()


#Função que seta as configurações da música que deve ser tocada na abertura do jogo
func playSong():
	self.add_child(player)
	player.stream = load("res://Assets/Sounds/JeffSpeed68_-_Little_reindeer (online-audio-converter.com).ogg")
	player.volume_db = -20


#Função que seta as configurações do som que deve ser tocado quando o mouse encosta em alguma opção de menus
func mouseHover_effect():
	self.add_child(mouseHover_sound)
	mouseHover_sound.stream = load("res://Assets/Sounds/biting.wav")
	#mouseHover_sound.stream = load("res://Assets/Sounds/menuSelection.wav")
	mouseHover_sound.volume_db = -25