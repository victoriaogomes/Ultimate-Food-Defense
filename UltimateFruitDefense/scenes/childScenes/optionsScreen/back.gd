extends TextureButton

#Carregando assets para mexer no sprite "back"
var base_back_english = preload("res://assets/sprites/optionsScreen/texts/English/Back.png")
var hover_back_english = preload("res://assets/sprites/optionsScreen/texts/English/Back(v2).png")
var base_back_portuguese = preload("res://assets/sprites/optionsScreen/texts/Pt-Br/Voltar.png")
var hover_back_portuguese = preload("res://assets/sprites/optionsScreen/texts/Pt-Br/Voltar(v2).png")
onready var animation = get_node("../AnimationPlayer")
var scene


#Chama a função "language" para colocar o text do sprite no idioma correto
func _ready():
	language()
	#warning-ignore:return_value_discarded
	configuration.connect("language_changed", self, "language")


#Alterando o idioma do label "back"/"voltar" com base nas configurações definidas
func language():
	if(configuration.language_english):
		self.set_normal_texture(base_back_english)
		self.set_hover_texture(hover_back_english)
	else:
		self.set_normal_texture(base_back_portuguese)
		self.set_hover_texture(hover_back_portuguese)


#Mouse clicando no botão "back"/"voltar"
func _on_back_pressed():
	scene = get_tree().get_current_scene().filename
	scene.erase(0,scene.find_last("/")+1)
	scene.erase(scene.findn(".tscn"), 5)
	if(scene == "titleScreen"):
		get_node("/root/Node2D/options").set_visible(false)
		get_node("/root/Node2D/Node2D/bananaStaticBody2D").set_pickable(true)
		get_node("/root/Node2D/Node2D/tomatoStaticBody2D").set_pickable(true)
		get_node("/root/Node2D/Node2D/pepperStaticBody2D").set_pickable(true)
		get_node("/root/Node2D/Node2D/cucumberStaticBody2D").set_pickable(true)
		get_node("/root/Node2D/Node2D/pineappleStaticBody2D").set_pickable(true)
		animation.play_backwards("options_configuration", -1)
		yield(animation, "animation_finished")
	else:
		get_node("/root/Node2D/pause/options").set_visible(false)
		get_node("/root/Node2D/pause/black_background").set_visible(true)
		get_node("/root/Node2D/pause/white_background").set_visible(true)
		get_node("/root/Node2D/pause/box1").set_visible(true)


func _on_back_mouse_entered():
	if(configuration.sound_effects):
		configuration.mouseHover_sound.play()