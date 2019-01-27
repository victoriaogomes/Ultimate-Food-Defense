extends StaticBody2D

#Carregando assets para mexer no sprites "credits" e "pepperBox"
var next_scene = preload("res://scenes/childScenes/creditScreen/credit.tscn")
var base_english_text = preload("res://assets/sprites/titleScreen/texts/English/Credits.png")
var hover_english_text = preload("res://assets/sprites/titleScreen/texts/English/Credits(v2).png")
var base_portuguese_text = preload("res://assets/sprites/titleScreen/texts/Pt-Br/Créditos.png")
var hover_portuguese_text = preload("res://assets/sprites/titleScreen/texts/Pt-Br/Créditos(v2).png")

#Carregando os respectivos staticBody2D das caixas de frutas
onready var banana = get_node("/root/Node2D/Node2D/bananaStaticBody2D")
onready var tomato = get_node("/root/Node2D/Node2D/tomatoStaticBody2D")
onready var cucumber = get_node("/root/Node2D/Node2D/cucumberStaticBody2D")
onready var pineapple = get_node("/root/Node2D/Node2D/pineappleStaticBody2D")
onready var credits = get_node("/root/Node2D/credits")


#Variáveis para controlar a posição do texto "Credits"/"Créditos" e do sprite "pepperBox"
var pos_origin_sprite
var pos_new_sprite
var pos_origin_text
var pos_new_text


#Coloca os sprites com labels para o idioma definido nas configurações e armazena em certas variáveis a posição dos sprites
func _ready():
	configuration.connect("language_changed", self, "language")
	pos_origin_sprite = $pepperBox.get_position()
	pos_origin_text = $credits.get_position()
	pos_new_sprite = $pepperBox.get_position()
	pos_new_text = $credits.get_position()
	pos_new_sprite.y = pos_new_sprite.y-1
	pos_new_text.y = pos_new_text.y-1


#Alterando o idioma do label "Credits"/"Créditos" com base nas configurações definidas
func language():
	if(!configuration.language_english):
		$credits.set_texture(base_portuguese_text)
	else:
		$credits.set_texture(base_english_text)


#Mouse clicando no sprite "pepperBox"
func _on_pepperStaticBody2D_input_event(viewport, event, shape_idx):
	if(Input.is_mouse_button_pressed(BUTTON_LEFT)):
		self.set_pickable(false)
		banana.set_pickable(false)
		tomato.set_pickable(false)
		pineapple.set_pickable(false)
		cucumber.set_pickable(false)
		credits.language()
		credits.set_visible(true)
		get_node("/root/Node2D/credits/AnimationPlayer").play("showing_credits", -1, 1.0, false)
		yield(get_node("/root/Node2D/credits/AnimationPlayer"), "animation_finished")


#Mouse entrando no sprite "pepperBox"
func _on_pepperStaticBody2D_mouse_entered():
	if(configuration.sound_effects):
		configuration.mouseHover_sound.play()
	$pepperBox.set_position(pos_new_sprite)
	$credits.set_position(pos_new_text)
	if(configuration.language_english == true):
		$credits.set_texture(hover_english_text)
	else:
		$credits.set_texture(hover_portuguese_text)


#Mouse saindo do sprite "pepperBox"
func _on_pepperStaticBody2D_mouse_exited():
	$pepperBox.set_position(pos_origin_sprite)
	$credits.set_position(pos_origin_text)
	if(configuration.language_english == true):
		$credits.set_texture(base_english_text)
	else:
		$credits.set_texture(base_portuguese_text)