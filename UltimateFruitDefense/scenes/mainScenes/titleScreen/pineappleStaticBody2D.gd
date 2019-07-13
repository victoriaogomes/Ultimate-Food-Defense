extends StaticBody2D

#Carregando assets para mexer no sprites "newGame" e "pineappleBox"
var base_english_text = preload("res://assets/sprites/titleScreen/texts/English/NewGame.png")
var hover_english_text = preload("res://assets/sprites/titleScreen/texts/English/NewGame(v2).png")
var base_portuguese_text = preload("res://assets/sprites/titleScreen/texts/Pt-Br/NovoJogo.png")
var hover_portuguese_text = preload("res://assets/sprites/titleScreen/texts/Pt-Br/NovoJogo(v2).png")

#Carregando os respectivos staticBody2D das caixas de frutas
onready var banana = get_node("/root/Node2D/Node2D/bananaStaticBody2D")
onready var tomato = get_node("/root/Node2D/Node2D/tomatoStaticBody2D")
onready var pepper = get_node("/root/Node2D/Node2D/pepperStaticBody2D")
onready var cucumber = get_node("/root/Node2D/Node2D/cucumberStaticBody2D")

#Carregando a tela que pede as infos do jogador
onready var player_info = get_node("/root/Node2D/player_info")


#Variáveis para controlar a posição do texto "New game"/"Novo jogo" e do sprite "pineappleBox"
var pos_origin_sprite
var pos_new_sprite
var pos_origin_text
var pos_new_text


#Chama a função para colocar sprites com labels para o idioma definido nas configurações e armazena em certas variáveis a posição dos sprites
func _ready():
	#warning-ignore:return_value_discarded
	configuration.connect("language_changed", self, "language")
	pos_origin_sprite = $pineappleBox.get_position()
	pos_origin_text = $newGame.get_position()
	pos_new_sprite = $pineappleBox.get_position()
	pos_new_text = $newGame.get_position()
	pos_new_sprite.y = pos_new_sprite.y-3
	pos_new_text.y = pos_new_text.y-3


#Alterando o idioma do label "New game"/"Novo jogo" com base nas configurações definidas
func language():
	if(configuration.language_english):
		$newGame.set_texture(base_english_text)
	else:
		$newGame.set_texture(base_portuguese_text)


#Mouse clicando no sprite "pineappleBox"
#warning-ignore:unused_argument
#warning-ignore:unused_argument
#warning-ignore:unused_argument
func _on_pineappleStaticBody2D_input_event(viewport, event, shape_idx):
	if(Input.is_mouse_button_pressed(BUTTON_LEFT)):
		self.set_pickable(false)
		banana.set_pickable(false)
		tomato.set_pickable(false)
		pepper.set_pickable(false)
		cucumber.set_pickable(false)
		player_info.set_visible(true)
		get_node("/root/Node2D/player_info/AnimationPlayer").play("info_player", -1, 1.0, false)
		yield(get_node("/root/Node2D/player_info/AnimationPlayer"), "animation_finished")


#Mouse entrando no sprite "pineappleBox"
func _on_pineappleStaticBody2D_mouse_entered():
	if(configuration.sound_effects):
		configuration.mouseHover_sound.play()
	$pineappleBox.set_position(pos_new_sprite)
	$newGame.set_position(pos_new_text)
	if(configuration.language_english == true):
		$newGame.set_texture(hover_english_text)
	else:
		$newGame.set_texture(hover_portuguese_text)


#Mouse saindo do sprite "pineappleBox"
func _on_pineappleStaticBody2D_mouse_exited():
	$pineappleBox.set_position(pos_origin_sprite)
	$newGame.set_position(pos_origin_text)
	if(configuration.language_english == true):
		$newGame.set_texture(base_english_text)
	else:
		$newGame.set_texture(base_portuguese_text)