extends StaticBody2D

onready var text = get_node("newGame")
onready var sprite = get_node("pineappleBox")
var base_text = preload("res://Assets/Sprites/TitleScreen/Texts/English/New game.png")
var hover_text = preload("res://Assets/Sprites/TitleScreen/Texts/English/New game(v2).png")
var pos_origin_sprite
var pos_new_sprite
var pos_origin_text
var pos_new_text

func _ready():
	pos_origin_sprite = sprite.get_position()
	pos_origin_text = text.get_position()
	pos_new_sprite = sprite.get_position()
	pos_new_text = text.get_position()
	pos_new_sprite.y = pos_new_sprite.y-3
	pos_new_text.y = pos_new_text.y-3


func _on_pineappleStaticBody2D_mouse_entered():
	sprite.set_position(pos_new_sprite)
	text.set_position(pos_new_text)
	text.set_texture(hover_text)


func _on_pineappleStaticBody2D_mouse_exited():
	sprite.set_position(pos_origin_sprite)
	text.set_position(pos_origin_text)
	text.set_texture(base_text)
