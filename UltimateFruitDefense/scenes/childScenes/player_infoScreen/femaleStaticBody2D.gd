extends StaticBody2D

onready var female_sprite = get_node("female")
onready var male_sprite = get_node("../maleStaticBody2D/male")
var base_femaleActive_sprite = preload("res://assets/sprites/player_infoScreen/player_sex/girl(v3).png")
var hover_femaleActive_sprite = preload("res://assets/sprites/player_infoScreen/player_sex/girl(v4).png")
var base_femaleInative_sprite = preload("res://assets/sprites/player_infoScreen/player_sex/girl.png")
var hover_femaleInative_sprite = preload("res://assets/sprites/player_infoScreen/player_sex/girl(v2).png")
var base_maleActive_sprite = preload("res://assets/sprites/player_infoScreen/player_sex/boy(v3).png")
var hover_maleActive_sprite = preload("res://assets/sprites/player_infoScreen/player_sex/boy(v4).png")
var base_maleInative_sprite = preload("res://assets/sprites/player_infoScreen/player_sex/boy.png")
var hover_maleInative_sprite = preload("res://assets/sprites/player_infoScreen/player_sex/boy(v2).png")


func _on_femaleStaticBody2D_input_event(viewport, event, shape_idx):
	if(Input.is_mouse_button_pressed(BUTTON_LEFT)):
		configuration.player_sex = "m"
		female_sprite.set_texture(hover_femaleActive_sprite)
		male_sprite.set_texture(base_maleInative_sprite)


func _on_femaleStaticBody2D_mouse_entered():
	if(configuration.sound_effects):
		configuration.mouseHover_sound.play()
	if(configuration.player_sex == "m"):
		female_sprite.set_texture(hover_femaleActive_sprite)
	else:
		female_sprite.set_texture(hover_femaleInative_sprite)


func _on_femaleStaticBody2D_mouse_exited():
	if(configuration.player_sex == "m"):
		female_sprite.set_texture(base_femaleActive_sprite)
	else:
		female_sprite.set_texture(base_femaleInative_sprite)


func _on_maleStaticBody2D_input_event(viewport, event, shape_idx):
	if(Input.is_mouse_button_pressed(BUTTON_LEFT)):
		configuration.player_sex = "h"
		male_sprite.set_texture(hover_maleActive_sprite)
		female_sprite.set_texture(base_femaleInative_sprite)


func _on_maleStaticBody2D_mouse_entered():
	if(configuration.sound_effects):
		configuration.mouseHover_sound.play()
	if(configuration.player_sex == "h"):
		male_sprite.set_texture(hover_maleActive_sprite)
	else:
		male_sprite.set_texture(hover_maleInative_sprite)


func _on_maleStaticBody2D_mouse_exited():
	if(configuration.player_sex == "h"):
		male_sprite.set_texture(base_maleActive_sprite)
	else:
		male_sprite.set_texture(base_maleInative_sprite)