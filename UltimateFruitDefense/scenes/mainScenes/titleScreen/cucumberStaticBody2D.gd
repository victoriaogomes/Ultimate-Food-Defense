extends StaticBody2D

#Carregando nodes e assets para mexer no sprites "options" e "cucumberBox"
onready var text = get_node("options")
onready var sprite = get_node("cucumberBox")
onready var options = get_node("/root/Node2D/options")
var base_english_text = preload("res://Assets/Sprites/TitleScreen/Texts/English/Options.png")
var hover_english_text = preload("res://Assets/Sprites/TitleScreen/Texts/English/Options(v2).png")
var base_portuguese_text = preload("res://Assets/Sprites/TitleScreen/Texts/Pt-Br/Opções.png")
var hover_portuguese_text = preload("res://Assets/Sprites/TitleScreen/Texts/Pt-Br/Opções(v2).png")

onready var banana = get_node("/root/Node2D/Node2D/bananaStaticBody2D")
onready var tomato = get_node("/root/Node2D/Node2D/tomatoStaticBody2D")
onready var pepper = get_node("/root/Node2D/Node2D/pepperStaticBody2D")
onready var pineapple = get_node("/root/Node2D/Node2D/pineappleStaticBody2D")

#Variáveis para controlar a posição do texto "Opções"/"Options" e do sprite "cucumberBox"
var pos_origin_sprite
var pos_new_sprite
var pos_origin_text
var pos_new_text


#Coloca os sprites com labels para o idioma definido nas configurações e armazena em certas variáveis a posição dos sprites
func _ready():
	language()
	self.set_process(true)
	pos_origin_sprite = sprite.get_position()
	pos_origin_text = text.get_position()
	pos_new_sprite = sprite.get_position()
	pos_new_text = text.get_position()
	pos_new_sprite.y = pos_new_sprite.y-1
	pos_new_text.y = pos_new_text.y-1


func _process(delta):
	language()


#Alterando o idioma do label "Options"/"Opções" com base nas configurações definidas
func language():
	if(!configuration.language_english):
		text.set_texture(base_portuguese_text)
	else:
		text.set_texture(base_english_text)


#Mouse clicando no sprite "cucumberBox"
func _on_cucumberStaticBody2D_input_event(viewport, event, shape_idx):
	var sEfect = AudioStreamPlayer.new()
	self.add_child(sEfect)
	#sEfect.stream = load("res://Assets/Sounds/biting.wav") #som fica bugado com touchpad
	sEfect.stream = load("res://Assets/Sounds/click.wav")
	sEfect.volume_db = -35
	if(!sEfect.playing):
		sEfect.play()
	if(Input.is_mouse_button_pressed(BUTTON_LEFT)):
		banana.set_pickable(false)
		tomato.set_pickable(false)
		pepper.set_pickable(false)
		pineapple.set_pickable(false)
		options.set_visible(true)
		get_node("/root/Node2D/options/AnimationPlayer").play("options_configuration", -1, 1.0, false)
		yield(get_node("/root/Node2D/options/AnimationPlayer"), "animation_finished")


#Mouse entrando no sprite "cucumberBox"
func _on_cucumberStaticBody2D_mouse_entered():
	if(configuration.sound_effects):
		configuration.mouseHover_sound.play()
	sprite.set_position(pos_new_sprite)
	text.set_position(pos_new_text)
	if(configuration.language_english == true):
		text.set_texture(hover_english_text)
	else:
		text.set_texture(hover_portuguese_text)


#Mouse saindo do sprite "cucumberBox"
func _on_cucumberStaticBody2D_mouse_exited():
	sprite.set_position(pos_origin_sprite)
	text.set_position(pos_origin_text)
	if(configuration.language_english == true):
		text.set_texture(base_english_text)
	else:
		text.set_texture(base_portuguese_text)