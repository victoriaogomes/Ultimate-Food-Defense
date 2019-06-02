extends StaticBody2D

#Carregando assets para mexer no sprite "back"
var base_back_english = preload("res://assets/sprites/optionsScreen/texts/English/Back.png")
var hover_back_english = preload("res://assets/sprites/optionsScreen/texts/English/Back(v2).png")
var base_back_portuguese = preload("res://assets/sprites/optionsScreen/texts/Pt-Br/Voltar.png")
var hover_back_portuguese = preload("res://assets/sprites/optionsScreen/texts/Pt-Br/Voltar(v2).png")
onready var animation = get_node("../AnimationPlayer")

onready var banana = get_node("/root/Node2D/Node2D/bananaStaticBody2D")
onready var tomato = get_node("/root/Node2D/Node2D/tomatoStaticBody2D")
onready var pepper = get_node("/root/Node2D/Node2D/pepperStaticBody2D")
onready var cucumber = get_node("/root/Node2D/Node2D/cucumberStaticBody2D")
onready var pineapple = get_node("/root/Node2D/Node2D/pineappleStaticBody2D")


#Chama a função "language" para colocar o text do sprite no idioma correto
func _ready():
	language()


#Alterando o idioma do label "back"/"voltar" com base nas configurações definidas
func language():
	if(configuration.language_english):
		$back.set_texture(base_back_english)
	else:
		$back.set_texture(base_back_portuguese)


#Mouse clicando no botão "back"/"voltar"
#warning-ignore:unused_argument
#warning-ignore:unused_argument
#warning-ignore:unused_argument
func _on_backStaticBody2D_input_event(viewport, event, shape_idx):
	if(Input.is_mouse_button_pressed(BUTTON_LEFT)):
		animation.play_backwards("showing_credits", -1)
		yield(animation, "animation_finished")
		get_node("/root/Node2D/credits").set_visible(false)
		banana.set_pickable(true)
		tomato.set_pickable(true)
		pepper.set_pickable(true)
		cucumber.set_pickable(true)
		pineapple.set_pickable(true)


#Mouse entrando no botão "back"/"voltar"
func _on_backStaticBody2D_mouse_entered():
	if(configuration.sound_effects):
		configuration.mouseHover_sound.play()
	if(configuration.language_english):
		$back.set_texture(hover_back_english)
	else:
		$back.set_texture(hover_back_portuguese)


#Mouse saindo do botão "back"/"voltar"
func _on_backStaticBody2D_mouse_exited():
	if(configuration.language_english):
		$back.set_texture(base_back_english)
	else:
		$back.set_texture(base_back_portuguese)