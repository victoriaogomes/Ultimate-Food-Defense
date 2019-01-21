extends StaticBody2D

onready var female_sprite = get_node("/root/Node2D/Node2D2/box1/i am a/femaleStaticBody2D/female")
onready var male_sprite = get_node("/root/Node2D/Node2D2/box1/i am a/maleStaticBody2D/male")
var base_female_sprite = preload("res://assets/sprites/player_infoScreen/player_sex/girl.png")
var hover_female_sprite = preload("res://assets/sprites/player_infoScreen/player_sex/girl(v2).png")
var base_male_sprite = preload("res://assets/sprites/player_infoScreen/player_sex/boy.png")
var hover_male_sprite = preload("res://assets/sprites/player_infoScreen/player_sex/boy(v2).png")


func _on_femaleStaticBody2D_input_event(viewport, event, shape_idx):
	if(Input.is_mouse_button_pressed(BUTTON_LEFT)):
		configuration.player_sex = "m"
		female_sprite.set_texture(hover_female_sprite)
		male_sprite.set_texture(base_male_sprite)


func _on_femaleStaticBody2D_mouse_entered():
	if(configuration.sound_effects):
		configuration.mouseHover_sound.play()
	female_sprite.set_texture(hover_female_sprite)


func _on_femaleStaticBody2D_mouse_exited():
	if(configuration.player_sex == "h"):
		female_sprite.set_texture(base_female_sprite)


func _on_maleStaticBody2D_input_event(viewport, event, shape_idx):
	if(Input.is_mouse_button_pressed(BUTTON_LEFT)):
		configuration.player_sex = "h"
		male_sprite.set_texture(hover_male_sprite)
		female_sprite.set_texture(base_female_sprite)


func _on_maleStaticBody2D_mouse_entered():
	if(configuration.sound_effects):
		configuration.mouseHover_sound.play()
	male_sprite.set_texture(hover_male_sprite)


func _on_maleStaticBody2D_mouse_exited():
	if(configuration.player_sex == "m"):
		male_sprite.set_texture(base_male_sprite)