extends StaticBody2D

#Carregando nodes e assets para mexer no sprites "back"
onready var backText = get_node("back")
var base_back_english = preload("res://Assets/Sprites/OptionsScreen/Texts/English/Back.png")
var hover_back_english = preload("res://Assets/Sprites/OptionsScreen/Texts/English/Back(v2).png")
var base_back_portuguese = preload("res://Assets/Sprites/OptionsScreen/Texts/Pt-Br/Voltar.png")
var hover_back_portuguese = preload("res://Assets/Sprites/OptionsScreen/Texts/Pt-Br/Voltar(v2).png")
onready var animation = get_node("../AnimationPlayer")


#Chama a função "language" para colocar o text do sprite no idioma correto
func _ready():
	language()


#Alterando o idioma do label "back"/"voltar" com base nas configurações definidas
func language():
	if(configuration.language_english):
		backText.set_texture(base_back_english)
	else:
		backText.set_texture(base_back_portuguese)


#Mouse clicando no botão "back"/"voltar"
func _on_backStaticBody2D_input_event(viewport, event, shape_idx):
	if(Input.is_mouse_button_pressed(BUTTON_LEFT)):
		animation.play_backwards("options_configuration", -1)
		yield(animation, "animation_finished")
		get_node("/root/Node2D/options").set_visible(false)


#Mouse entrando no botão "back"/"voltar"
func _on_backStaticBody2D_mouse_entered():
	if(configuration.sound_effects):
		configuration.mouseHover_sound.play()
	if(configuration.language_english):
		backText.set_texture(hover_back_english)
	else:
		backText.set_texture(hover_back_portuguese)


#Mouse saindo do botão "back"/"voltar"
func _on_backStaticBody2D_mouse_exited():
	if(configuration.language_english):
		backText.set_texture(base_back_english)
	else:
		backText.set_texture(base_back_portuguese)