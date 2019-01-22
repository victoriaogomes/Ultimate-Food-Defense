extends StaticBody2D

onready var sprite = get_node("start")
onready var text = get_node("../my name is/TextEdit")
var base_english_sprite = preload("res://assets/sprites/player_infoScreen/Texts/English/Start.png")
var hover_english_sprite = preload("res://assets/sprites/player_infoScreen/Texts/English/Start(v2).png")
var base_port_sprite = preload("res://assets/sprites/player_infoScreen/Texts/Pt-Br/Iniciar.png")
var hover_port_sprite = preload("res://assets/sprites/player_infoScreen/Texts/Pt-Br/Iniciar(v2).png")
var next_scene = preload("res://scenes/mainScenes/gameScreen/game.tscn")
onready var animation = get_node("../AnimationPlayer")


func _ready():
	text.cursor_set_blink_enabled(true)


func _on_startStaticBody2D_input_event(viewport, event, shape_idx):
	if(Input.is_mouse_button_pressed(BUTTON_LEFT)):
		animation.play_backwards("info_player", -1)
		configuration.player_name = text.get_text()
		yield(animation, "animation_finished")
		get_node("/root/Node2D/AnimationPlayer").play("car_leaving", -1, 1.0, false)
		yield(get_node("/root/Node2D/AnimationPlayer"), "animation_finished")
		get_tree().change_scene_to(next_scene)


func _on_startStaticBody2D_mouse_entered():
	#text.set_bg_color(Color(0,0,0))
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