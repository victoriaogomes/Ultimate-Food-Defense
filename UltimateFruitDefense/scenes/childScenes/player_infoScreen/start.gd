extends TextureButton

onready var text = get_node("../my name is/TextEdit")
var base_english_sprite = preload("res://assets/sprites/player_infoScreen/Texts/English/Start.png")
var hover_english_sprite = preload("res://assets/sprites/player_infoScreen/Texts/English/Start(v2).png")
var base_port_sprite = preload("res://assets/sprites/player_infoScreen/Texts/Pt-Br/Iniciar.png")
var hover_port_sprite = preload("res://assets/sprites/player_infoScreen/Texts/Pt-Br/Iniciar(v2).png")
var next_scene = preload("res://scenes/mainScenes/gameScreen/game.tscn")
onready var animation = get_node("../AnimationPlayer")


func _ready():
	text.cursor_set_blink_enabled(true)

func _on_start_pressed():
	animation.play_backwards("info_player", -1)
	configuration.player_name = text.get_text()
	yield(animation, "animation_finished")
	get_node("/root/Node2D/AnimationPlayer").play("car_leaving", -1, 1.0, false)
	yield(get_node("/root/Node2D/AnimationPlayer"), "animation_finished")
	get_tree().change_scene_to(next_scene)