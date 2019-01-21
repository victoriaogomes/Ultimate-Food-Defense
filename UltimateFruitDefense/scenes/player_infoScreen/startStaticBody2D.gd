extends StaticBody2D

onready var sprite = get_node("/root/Node2D/Node2D2/box1/startStaticBody2D/start")
var base_english_sprite = preload("res://assets/sprites/player_infoScreen/Texts/English/Start.png")
var hover_english_sprite = preload("res://assets/sprites/player_infoScreen/Texts/English/Start(v2).png")
var base_port_sprite = preload("res://assets/sprites/player_infoScreen/Texts/Pt-Br/Iniciar.png")
var hover_port_sprite = preload("res://assets/sprites/player_infoScreen/Texts/Pt-Br/Iniciar(v2).png")
var next_scene = preload("res://scenes/gameScreen/game.tscn")
onready var animation = get_node("/root/Node2D/AnimationPlayer")


func _on_startStaticBody2D_input_event(viewport, event, shape_idx):
	if(Input.is_mouse_button_pressed(BUTTON_LEFT)):
		animation.play_backwards("info_player", -1)
		yield(animation, "animation_finished")
		animation.play("car_leaving", -1, 1.0, false)
		yield(animation, "animation_finished")
		get_tree().change_scene_to(next_scene)


func _on_startStaticBody2D_mouse_entered():
	if(configuration.sound_effects):
		configuration.mouseHover_sound.play()
	if(configuration.language_english):
		sprite.set_texture(hover_english_sprite)
	else:
		sprite.set_texture(hover_port_sprite)


func _on_startStaticBody2D_mouse_exited():
	if(configuration.language_english):
		sprite.set_texture(base_english_sprite)
	else:
		sprite.set_texture(base_port_sprite)