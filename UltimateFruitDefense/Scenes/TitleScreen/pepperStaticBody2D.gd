extends StaticBody2D

onready var text = get_node("credits")
onready var sprite = get_node("pepperBox")
var base_text = preload("res://Assets/Sprites/TitleScreen/Texts/English/Credits.png")
var hover_text = preload("res://Assets/Sprites/TitleScreen/Texts/English/Credits(v2).png")
var pos_origin_sprite
var pos_new_sprite
var pos_origin_text
var pos_new_text

func _ready():
	pos_origin_sprite = sprite.get_position()
	pos_origin_text = text.get_position()
	pos_new_sprite = sprite.get_position()
	pos_new_text = text.get_position()
	pos_new_sprite.y = pos_new_sprite.y-1
	pos_new_text.y = pos_new_text.y-1


func _on_pepperStaticBody2D_mouse_entered():
	sprite.set_position(pos_new_sprite)
	text.set_position(pos_new_text)
	text.set_texture(hover_text)


func _on_pepperStaticBody2D_mouse_exited():
	sprite.set_position(pos_origin_sprite)
	text.set_position(pos_origin_text)
	text.set_texture(base_text)