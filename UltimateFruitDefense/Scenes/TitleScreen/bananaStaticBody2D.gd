extends StaticBody2D

#Carregando nodes e assets para mexer no sprites "loadGame" e "bananaBox"
onready var text = get_node("loadGame")
onready var sprite = get_node("bananaBox")
var base_english_text = preload("res://Assets/Sprites/TitleScreen/Texts/English/Load game.png")
var hover_english_text = preload("res://Assets/Sprites/TitleScreen/Texts/English/Load game(v2).png")
var base_portuguese_text = preload("res://Assets/Sprites/TitleScreen/Texts/Pt-Br/Jogos salvos.png")
var hover_portuguese_text = preload("res://Assets/Sprites/TitleScreen/Texts/Pt-Br/Jogos salvos(v2).png")

#Variáveis para controlar a posição do texto "Load Game"/"Jogos Salvos" e do sprite "bananaBox"
var pos_origin_sprite
var pos_new_sprite
var pos_origin_text
var pos_new_text


#Coloca os sprites com labels para o idioma definido nas configurações e armazena em certas variáveis a posição dos sprites
func _ready():
	language()
	pos_origin_sprite = sprite.get_position()
	pos_origin_text = text.get_position()
	pos_new_sprite = sprite.get_position()
	pos_new_text = text.get_position()
	pos_new_sprite.y = pos_new_sprite.y-1
	pos_new_text.y = pos_new_text.y-1


#Alterando o idioma do label "Load game"/"Carregar jogo" com base nas configurações definidas
func language():
	if(configuration.language_english == false):
		text.set_texture(base_portuguese_text)
	else:
		text.set_texture(base_english_text)


#Mouse clicando no sprite "bananaBox"
func _on_bananaStaticBody2D_input_event(viewport, event, shape_idx):
	pass # replace with function body


#Mouse entrando no sprite "bananaBox"
func _on_bananaStaticBody2D_mouse_entered():
	var sEfect = AudioStreamPlayer.new()
	self.add_child(sEfect)
	sEfect.stream = load("res://Assets/Sounds/menuSelection.wav")
	sEfect.volume_db = -25
	sEfect.play()
	sprite.set_position(pos_new_sprite)
	text.set_position(pos_new_text)
	if(configuration.language_english == true):
		text.set_texture(hover_english_text)
	else:
		text.set_texture(hover_portuguese_text)


#Mouse saindo do sprite "bananaBox"
func _on_bananaStaticBody2D_mouse_exited():
	sprite.set_position(pos_origin_sprite)
	text.set_position(pos_origin_text)
	if(configuration.language_english == true):
		text.set_texture(base_english_text)
	else:
		text.set_texture(base_portuguese_text)