extends StaticBody2D

onready var text = get_node("options")
onready var sprite = get_node("cucumberBox")
var next_scene = preload("res://Scenes/OptionsScreen/options.tscn")
var base_english_text = preload("res://Assets/Sprites/TitleScreen/Texts/English/Options.png")
var hover_english_text = preload("res://Assets/Sprites/TitleScreen/Texts/English/Options(v2).png")
var base_portuguese_text = preload("res://Assets/Sprites/TitleScreen/Texts/Pt-Br/Opções.png")
var hover_portuguese_text = preload("res://Assets/Sprites/TitleScreen/Texts/Pt-Br/Opções(v2).png")

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


func _on_cucumberStaticBody2D_mouse_entered():
	sprite.set_position(pos_new_sprite)
	text.set_position(pos_new_text)
	if(idioma.english == true):
		text.set_texture(hover_english_text)
	else:
		text.set_texture(hover_portuguese_text)


func _on_cucumberStaticBody2D_mouse_exited():
	sprite.set_position(pos_origin_sprite)
	text.set_position(pos_origin_text)
	if(idioma.english == true):
		text.set_texture(base_english_text)
	else:
		text.set_texture(base_portuguese_text)


func _on_cucumberStaticBody2D_input_event(viewport, event, shape_idx):
	if(event is InputEventMouseButton):
		if(event.button_index == 1): 
			get_tree().change_scene_to(next_scene)