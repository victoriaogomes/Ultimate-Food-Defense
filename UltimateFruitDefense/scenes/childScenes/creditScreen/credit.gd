extends Node2D

var portuguese_credits = preload("res://assets/sprites/creditScreen/texts/pt-Br/Creditos.png")
var portuguese_gameCoding = preload("res://assets/sprites/creditScreen/texts/pt-Br/Codificacao_do_jogo.png")
var portuguese_charactersDrawing = preload("res://assets/sprites/creditScreen/texts/pt-Br/DesenhoDosPersonagens.png")
var portuguese_fenceDrawing = preload("res://assets/sprites/creditScreen/texts/pt-Br/DesenhodaCerca.png")
var portuguese_fruitCarDrawing = preload("res://assets/sprites/creditScreen/texts/pt-Br/DesenhoDoCarrinhoDeFrutas.png")
var portuguese_titleScreenScenario = preload("res://assets/sprites/creditScreen/texts/pt-Br/Cenario_da_tela_inicial_Desenho_da_menina_e_do_menino_placa_de_madeira.png")
var portuguese_titleScreenSong = preload("res://assets/sprites/creditScreen/texts/pt-Br/MusicaDaTelaInicial.png")
var portuguese_mastermind = preload("res://assets/sprites/creditScreen/texts/pt-Br/Orientacao.png")

var english_credits = preload("res://assets/sprites/creditScreen/texts/english/Credits.png")
var english_gameCoding = preload("res://assets/sprites/creditScreen/texts/english/GameCoding.png")
var english_charactersDrawing = preload("res://assets/sprites/creditScreen/texts/english/CharactersDrawing.png")
var english_fenceDrawing = preload("res://assets/sprites/creditScreen/texts/english/FenceDrawing.png")
var english_fruitCarDrawing = preload("res://assets/sprites/creditScreen/texts/english/FruitCarDrawing.png")
var english_titleScreenScenario = preload("res://assets/sprites/creditScreen/texts/english/TitleScreenScenario_boy_and_girl_drawing_wooden_plaque.png")
var english_titleScreenSong = preload("res://assets/sprites/creditScreen/texts/english/TitleScreenSong.png")
var english_mastermind = preload("res://assets/sprites/creditScreen/texts/english/mastermind.png")

var gameCodingPortuguese_Pos
var gameCodingEnglish_Pos
var charactersDrawingPortuguese_Pos
var charactersDrawingEnglish_Pos
var fenceDrawingPortuguese_Pos
var fenceDrawingEnglish_Pos
var fruitCarDrawingPortuguese_Pos
var fruitCarDrawingEnglish_Pos
var titleScreenScenarioPortuguese_Pos
var titleScreenScenarioEnglish_Pos
var titleScreenSongPortuguese_Pos
var titleScreenSongEnglish_Pos


func _ready():
	#Posição do título "Game Coding" no idioma inglês e português
	gameCodingPortuguese_Pos = $gameCoding.get_position()
	gameCodingEnglish_Pos = $gameCoding.get_position()
	gameCodingPortuguese_Pos.x+=2.3
	#Posição do título "Character drawing" no idioma inglês e português
	charactersDrawingPortuguese_Pos = $charactersDrawing.get_position()
	charactersDrawingEnglish_Pos = $charactersDrawing.get_position()
	charactersDrawingPortuguese_Pos.x +=2
	#Posição do título "Fence drawing" no idioma inglês e português
	fenceDrawingPortuguese_Pos = $fenceDrawing.get_position()
	fenceDrawingEnglish_Pos = $fenceDrawing.get_position()
	fenceDrawingPortuguese_Pos.x +=0.7
	#Posição do título "Fruit car drawing" no idioma inglês e português
	fruitCarDrawingPortuguese_Pos = $fruitCarDrawing.get_position()
	fruitCarDrawingEnglish_Pos = $fruitCarDrawing.get_position()
	fruitCarDrawingPortuguese_Pos.x +=4.3
	#Posição do título "Title Screen Scenario" no idioma inglês e português
	titleScreenScenarioPortuguese_Pos = $titleScreenScenario.get_position()
	titleScreenScenarioEnglish_Pos = $titleScreenScenario.get_position()
	titleScreenScenarioPortuguese_Pos.x +=5.3
	#Posição do título "Title Screen Song" no idioma inglês e português
	titleScreenSongPortuguese_Pos = $titleScreenSong.get_position()
	titleScreenSongEnglish_Pos = $titleScreenSong.get_position()
	titleScreenSongPortuguese_Pos.x +=1.2


func language():
	$backStaticBody2D.language()
	if(!configuration.language_english):
		$credits.set_texture(portuguese_credits)
		$gameCoding.set_texture(portuguese_gameCoding)
		$gameCoding.set_position(gameCodingPortuguese_Pos)
		$charactersDrawing.set_texture(portuguese_charactersDrawing)
		$charactersDrawing.set_position(charactersDrawingPortuguese_Pos)
		$fenceDrawing.set_texture(portuguese_fenceDrawing)
		$fenceDrawing.set_position(fenceDrawingPortuguese_Pos)
		$fruitCarDrawing.set_texture(portuguese_fruitCarDrawing)
		$fruitCarDrawing.set_position(fruitCarDrawingPortuguese_Pos)
		$titleScreenScenario.set_texture(portuguese_titleScreenScenario)
		$titleScreenScenario.set_position(titleScreenScenarioPortuguese_Pos)
		$titleScreenSong.set_texture(portuguese_titleScreenSong)
		$titleScreenSong.set_position(titleScreenSongPortuguese_Pos)
		$mastermind.set_texture(portuguese_mastermind)
	else:
		$credits.set_texture(english_credits)
		$gameCoding.set_texture(english_gameCoding)
		$gameCoding.set_position(gameCodingEnglish_Pos)
		$charactersDrawing.set_texture(english_charactersDrawing)
		$charactersDrawing.set_position(charactersDrawingEnglish_Pos)
		$fenceDrawing.set_texture(english_fenceDrawing)
		$fenceDrawing.set_position(fenceDrawingEnglish_Pos)
		$fruitCarDrawing.set_texture(english_fruitCarDrawing)
		$fruitCarDrawing.set_position(fruitCarDrawingEnglish_Pos)
		$titleScreenScenario.set_texture(english_titleScreenScenario)
		$titleScreenScenario.set_position(titleScreenScenarioEnglish_Pos)
		$titleScreenSong.set_texture(english_titleScreenSong)
		$titleScreenSong.set_position(titleScreenSongEnglish_Pos)
		$mastermind.set_texture(english_mastermind)