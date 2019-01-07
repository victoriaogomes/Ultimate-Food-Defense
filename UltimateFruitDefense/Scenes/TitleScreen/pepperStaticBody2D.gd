extends StaticBody2D

onready var text = get_node("credits")
onready var sprite = get_node("pepperBox")
var base_english_text = preload("res://Assets/Sprites/TitleScreen/Texts/English/Credits.png")
var hover_english_text = preload("res://Assets/Sprites/TitleScreen/Texts/English/Credits(v2).png")
var base_portuguese_text = preload("res://Assets/Sprites/TitleScreen/Texts/Pt-Br/Créditos.png")
var hover_portuguese_text = preload("res://Assets/Sprites/TitleScreen/Texts/Pt-Br/Créditos(v2).png")

var pos_origin_sprite
var pos_new_sprite
var pos_origin_text
var pos_new_text

func _ready():
	if(idioma.english == false):
		text.set_texture(base_portuguese_text)
	pos_origin_sprite = sprite.get_position()
	pos_origin_text = text.get_position()
	pos_new_sprite = sprite.get_position()
	pos_new_text = text.get_position()
	pos_new_sprite.y = pos_new_sprite.y-1
	pos_new_text.y = pos_new_text.y-1


func language():
	if(idioma.english == false):
		text.set_texture(base_portuguese_text)
	else:
		text.set_texture(base_english_text)


func _on_pepperStaticBody2D_mouse_entered():
	sprite.set_position(pos_new_sprite)
	text.set_position(pos_new_text)
	if(idioma.english == true):
		text.set_texture(hover_english_text)
	else:
		text.set_texture(hover_portuguese_text)


func _on_pepperStaticBody2D_mouse_exited():
	sprite.set_position(pos_origin_sprite)
	text.set_position(pos_origin_text)
	if(idioma.english == true):
		text.set_texture(base_english_text)
	else:
		text.set_texture(base_portuguese_text)