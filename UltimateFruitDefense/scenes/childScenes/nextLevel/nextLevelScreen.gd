extends Node2D

var girl = preload("res://assets/sprites/player_infoScreen/player_sex/girl.png")
var boy = preload("res://assets/sprites/player_infoScreen/player_sex/boy.png")
var congratsPort = preload("res://assets/sprites/nextLevel/texts/pt-Br/Parabens.png")
var congratsEngli = preload("res://assets/sprites/nextLevel/texts/english/congratulations.png")
var healthPort = preload("res://assets/sprites/nextLevel/texts/pt-Br/vcSaudavel.png")
var healthEngli = preload("res://assets/sprites/nextLevel/texts/english/youHealth.png")

func _ready():
	language()
	#warning-ignore:return_value_discarded
	configuration.connect("language_changed", self, "language")
	if(configuration.player_sex == "h"):
		$avatar.set_texture(boy)
	else:
		$avatar.set_texture(girl)

func language():
	if(configuration.language_english):
		$congratulations.set_texture(congratsEngli)
		$health.set_texture(healthEngli)
	else:
		$congratulations.set_texture(congratsPort)
		$health.set_texture(healthPort)


func _on_nextLevel_pressed():
	get_tree().set_pause(false)
	#warning-ignore:return_value_discarded
	get_tree().reload_current_scene()


func _on_nextLevel_mouse_entered():
	if(configuration.sound_effects):
		configuration.mouseHover_sound.play()
