extends TextureButton

#Carregando assets para mexer no sprite "back"
var base_back_english = preload("res://Assets/Sprites/OptionsScreen/Texts/English/Back.png")
var hover_back_english = preload("res://Assets/Sprites/OptionsScreen/Texts/English/Back(v2).png")
var base_back_portuguese = preload("res://Assets/Sprites/OptionsScreen/Texts/Pt-Br/Voltar.png")
var hover_back_portuguese = preload("res://Assets/Sprites/OptionsScreen/Texts/Pt-Br/Voltar(v2).png")
onready var animation = get_node("../AnimationPlayer")

onready var banana = get_node("/root/Node2D/Node2D/bananaStaticBody2D")
onready var tomato = get_node("/root/Node2D/Node2D/tomatoStaticBody2D")
onready var pepper = get_node("/root/Node2D/Node2D/pepperStaticBody2D")
onready var cucumber = get_node("/root/Node2D/Node2D/cucumberStaticBody2D")
onready var pineapple = get_node("/root/Node2D/Node2D/pineappleStaticBody2D")


#Chama a função "language" para colocar o text do sprite no idioma correto
func _ready():
	language()
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
	animation.play_backwards("options_configuration", -1)
	yield(animation, "animation_finished")
	get_node("/root/Node2D/options").set_visible(false)
	banana.set_pickable(true)
	tomato.set_pickable(true)
	pepper.set_pickable(true)
	cucumber.set_pickable(true)
	pineapple.set_pickable(true)
