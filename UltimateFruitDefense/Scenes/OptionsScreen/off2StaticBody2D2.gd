extends StaticBody2D

onready var text = get_node("off")
var base_text_off = preload("res://Assets/Sprites/OptionsScreen/Texts/English/off.png")
var base_text_on = preload("res://Assets/Sprites/OptionsScreen/Texts/English/off(v2).png")
var hover_text_off = preload("res://Assets/Sprites/OptionsScreen/Texts/English/off(v4).png")
var hover_text_on = preload("res://Assets/Sprites/OptionsScreen/Texts/English/off(v3).png")
var on

func _ready():
	on = false

func _on_off2StaticBody2D2_mouse_entered():
	if(on==true):
		text.set_texture(hover_text_on)
	else:
		text.set_texture(hover_text_off)


func _on_off2StaticBody2D2_mouse_exited():
	if(on==true):
		text.set_texture(base_text_on)
	else:
		text.set_texture(base_text_off)