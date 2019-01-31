extends Node2D

#Script "Global", carregado por todas as cenas

#Variáveis para as configurações do jogo: idioma, música, efeitos sonoros
var language_english
var music
var sound_effects
var player = AudioStreamPlayer.new()
var mouseHover_sound = AudioStreamPlayer.new()
var gun_sound = AudioStreamPlayer.new()

#Variável que representa o sexo do jogador. É "m" caso seja mulher e "h" caso seja homem
var player_sex

#Variável que armazena o nome do jogador
var player_name

#Sinal emitido quando o idioma do jogo é mudado
signal language_changed

#Nível em que o jogador se encontra
var level = 1


#Por default, coloca o idioma em português e os efeitos sonoros e a música ligados
func _ready():
	language_english = true
	sound_effects = true
	music = true
	playSong()
	mouseHover_effect()
	gunSound()


#Altera o idioma do jogo para português
func port():
	language_english = false
	emit_signal("language_changed")


#Altera o idioma do jogo para inglês
func engli():
	language_english = true
	emit_signal("language_changed")


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
	player.stream = load("res://assets/sounds/JeffSpeed68_-_Little_reindeer (online-audio-converter.com).ogg")
	player.volume_db = -20


#Função que seta as configurações do som que deve ser tocado quando o mouse encosta em alguma opção de menus
func mouseHover_effect():
	self.add_child(mouseHover_sound)
	mouseHover_sound.stream = load("res://assets/sounds/menuSelection.wav")
	mouseHover_sound.volume_db = -25


#Função para salvar os dados do jogo
func salvarDados():
	var arquivo = File.new()
	var erro = arquivo.open("user://save.data", File.WRITE)
	if not erro:
		arquivo.store_var(level)
	else:
		print("Erro ao salvar dados")
	arquivo.close()


#Função para carregar os dados do jogo
func carregarDados():
	var arquivo = File.new()
	var erro = arquivo.open("user://save.data", File.READ)
	if not erro:
		var dadosSalvos = arquivo.get_var()
		level = dadosSalvos
	else:
		print("Erro ao carregar dados")
	arquivo.close()


func gunSound():
	self.add_child(gun_sound)
	gun_sound.stream = load("res://assets/sounds/gun.wav")
	gun_sound.volume_db = -25