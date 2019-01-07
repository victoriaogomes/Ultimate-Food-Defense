extends StaticBody2D

#Carregando nodes e assets para mexer no sprites "options" e "cucumberBox"
onready var text = get_node("options")
onready var sprite = get_node("cucumberBox")
var next_scene = preload("res://Scenes/OptionsScreen/options.tscn")
var base_english_text = preload("res://Assets/Sprites/TitleScreen/Texts/English/Options.png")
var hover_english_text = preload("res://Assets/Sprites/TitleScreen/Texts/English/Options(v2).png")
var base_portuguese_text = preload("res://Assets/Sprites/TitleScreen/Texts/Pt-Br/Opções.png")
var hover_portuguese_text = preload("res://Assets/Sprites/TitleScreen/Texts/Pt-Br/Opções(v2).png")

#Variáveis para controlar a posição do texto "Opções"/"Options" e do sprite "cucumberBox"
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


#Alterando o idioma do label "Options"/"Opções" com base nas configurações definidas
func language():
	if(configuration.language_english == false):
		text.set_texture(base_portuguese_text)
	else:
		text.set_texture(base_english_text)


#Mouse clicando no sprite "cucumberBox"
func _on_cucumberStaticBody2D_input_event(viewport, event, shape_idx):
	if(event is InputEventMouseButton):
		if(event.button_index == 1): 
			get_tree().change_scene_to(next_scene)


#Mouse entrando no sprite "cucumberBox"
func _on_cucumberStaticBody2D_mouse_entered():
	sprite.set_position(pos_new_sprite)
	text.set_position(pos_new_text)
	if(configuration.language_english == true):
		text.set_texture(hover_english_text)
	else:
		text.set_texture(hover_portuguese_text)


#Mouse saindo do sprite "cucumberBox"
func _on_cucumberStaticBody2D_mouse_exited():
	sprite.set_position(pos_origin_sprite)
	text.set_position(pos_origin_text)
	if(configuration.language_english == true):
		text.set_texture(base_english_text)
	else:
		text.set_texture(base_portuguese_text)