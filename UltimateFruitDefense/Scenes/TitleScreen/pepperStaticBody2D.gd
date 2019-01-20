extends StaticBody2D

#Carregando nodes e assets para mexer no sprites "credits" e "pepperBox"
onready var text = get_node("credits")
onready var sprite = get_node("pepperBox")
var next_scene = preload("res://Scenes/CreditScreen/credit.tscn")
var base_english_text = preload("res://Assets/Sprites/TitleScreen/Texts/English/Credits.png")
var hover_english_text = preload("res://Assets/Sprites/TitleScreen/Texts/English/Credits(v2).png")
var base_portuguese_text = preload("res://Assets/Sprites/TitleScreen/Texts/Pt-Br/Créditos.png")
var hover_portuguese_text = preload("res://Assets/Sprites/TitleScreen/Texts/Pt-Br/Créditos(v2).png")

#Variáveis para controlar a posição do texto "Credits"/"Créditos" e do sprite "pepperBox"
var pos_origin_sprite
var pos_new_sprite
var pos_origin_text
var pos_new_text


#Coloca os sprites com labels para o idioma definido nas configurações e armazena em certas variáveis a posição dos sprites
func _ready():
	if(configuration.language_english == false):
		text.set_texture(base_portuguese_text)
	pos_origin_sprite = sprite.get_position()
	pos_origin_text = text.get_position()
	pos_new_sprite = sprite.get_position()
	pos_new_text = text.get_position()
	pos_new_sprite.y = pos_new_sprite.y-1
	pos_new_text.y = pos_new_text.y-1


#Alterando o idioma do label "Credits"/"Créditos" com base nas configurações definidas
func language():
	if(configuration.language_english == false):
		text.set_texture(base_portuguese_text)
	else:
		text.set_texture(base_english_text)


#Mouse clicando no sprite "pepperBox"
func _on_pepperStaticBody2D_input_event(viewport, event, shape_idx):
	if(Input.is_mouse_button_pressed(BUTTON_LEFT)):
		get_tree().change_scene_to(next_scene)


#Mouse entrando no sprite "pepperBox"
func _on_pepperStaticBody2D_mouse_entered():
	if(configuration.sound_effects):
		configuration.mouseHover_sound.play()
	sprite.set_position(pos_new_sprite)
	text.set_position(pos_new_text)
	if(configuration.language_english == true):
		text.set_texture(hover_english_text)
	else:
		text.set_texture(hover_portuguese_text)


#Mouse saindo do sprite "pepperBox"
func _on_pepperStaticBody2D_mouse_exited():
	sprite.set_position(pos_origin_sprite)
	text.set_position(pos_origin_text)
	if(configuration.language_english == true):
		text.set_texture(base_english_text)
	else:
		text.set_texture(base_portuguese_text)