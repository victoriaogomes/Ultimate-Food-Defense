extends StaticBody2D

#Carregando assets para mexer no sprites "options" e "cucumberBox"
var base_english_text = preload("res://assets/sprites/titleScreen/texts/English/Options.png")
var hover_english_text = preload("res://assets/sprites/titleScreen/texts/English/Options(v2).png")
var base_portuguese_text = preload("res://assets/sprites/titleScreen/texts/Pt-Br/Opções.png")
var hover_portuguese_text = preload("res://assets/sprites/titleScreen/texts/Pt-Br/Opções(v2).png")

#Carregando os respectivos staticBody2D das caixas de frutas
onready var banana = get_node("/root/Node2D/Node2D/bananaStaticBody2D")
onready var tomato = get_node("/root/Node2D/Node2D/tomatoStaticBody2D")
onready var pepper = get_node("/root/Node2D/Node2D/pepperStaticBody2D")
onready var pineapple = get_node("/root/Node2D/Node2D/pineappleStaticBody2D")

#Carregando a tela qde opções do jogo
onready var optionsScreen = get_node("/root/Node2D/options")

#Variáveis para controlar a posição do texto "Opções"/"Options" e do sprite "cucumberBox"
var pos_origin_sprite
var pos_new_sprite
var pos_origin_text
var pos_new_text


#Coloca os sprites com labels para o idioma definido nas configurações e armazena em certas variáveis a posição dos sprites
func _ready():
	configuration.connect("language_changed", self, "language")
	pos_origin_sprite = $cucumberBox.get_position()
	pos_origin_text = $options.get_position()
	pos_new_sprite = $cucumberBox.get_position()
	pos_new_text = $options.get_position()
	pos_new_sprite.y = pos_new_sprite.y-1
	pos_new_text.y = pos_new_text.y-1


#Alterando o idioma do label "Options"/"Opções" com base nas configurações definidas
func language():
	if(!configuration.language_english):
		$options.set_texture(base_portuguese_text)
	else:
		$options.set_texture(base_english_text)


#Mouse clicando no sprite "cucumberBox"
func _on_cucumberStaticBody2D_input_event(viewport, event, shape_idx):
	var sEfect = AudioStreamPlayer.new()
	self.add_child(sEfect)
	#sEfect.stream = load("res://Assets/Sounds/biting.wav") #som fica bugado com touchpad
	#sEfect.stream = load("res://Assets/Sounds/click.wav")
	sEfect.volume_db = -35
	if(!sEfect.playing):
		sEfect.play()
	if(Input.is_mouse_button_pressed(BUTTON_LEFT)):
		self.set_pickable(false)
		banana.set_pickable(false)
		tomato.set_pickable(false)
		pepper.set_pickable(false)
		pineapple.set_pickable(false)
		optionsScreen.set_visible(true)
		get_node("/root/Node2D/options/AnimationPlayer").play("options_configuration", -1, 1.0, false)
		yield(get_node("/root/Node2D/options/AnimationPlayer"), "animation_finished")


#Mouse entrando no sprite "cucumberBox"
func _on_cucumberStaticBody2D_mouse_entered():
	if(configuration.sound_effects):
		configuration.mouseHover_sound.play()
	$cucumberBox.set_position(pos_new_sprite)
	$options.set_position(pos_new_text)
	if(configuration.language_english == true):
		$options.set_texture(hover_english_text)
	else:
		$options.set_texture(hover_portuguese_text)


#Mouse saindo do sprite "cucumberBox"
func _on_cucumberStaticBody2D_mouse_exited():
	$cucumberBox.set_position(pos_origin_sprite)
	$options.set_position(pos_origin_text)
	if(configuration.language_english == true):
		$options.set_texture(base_english_text)
	else:
		$options.set_texture(base_portuguese_text)