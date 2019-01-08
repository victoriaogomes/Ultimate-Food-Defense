extends Sprite

# Nodes para mudar os textos dos boxes
onready var pineapple = get_node("/root/Node2D/Node2D/pineappleStaticBody2D")
onready var tomato = get_node("/root/Node2D/Node2D/tomatoStaticBody2D")
onready var pepper = get_node("/root/Node2D/Node2D/pepperStaticBody2D")
onready var cucumber = get_node("/root/Node2D/Node2D/cucumberStaticBody2D")
onready var banana = get_node("/root/Node2D/Node2D/bananaStaticBody2D")

# Nodes e assets para mexer no texto "Options"/Opções"
onready var optionsText = get_node("/root/Node2D/optionsTitle")
var options_english = preload("res://Assets/Sprites/OptionsScreen/Texts/English/Options.png")
var options_port = preload("res://Assets/Sprites/OptionsScreen/Texts/Pt-Br/Opcoes.png")
onready var options_english_position = optionsText.get_position()
onready var options_portuguese_position = optionsText.get_position()

# Nodes e assets para mexer no texto "Language"/"Idioma"
onready var languageText = get_node("/root/Node2D/language")
var language_english = preload("res://Assets/Sprites/OptionsScreen/Texts/English/Language.png")
var language_port = preload("res://Assets/Sprites/OptionsScreen/Texts/Pt-Br/Idioma.png")
onready var language_english_position = languageText.get_position()
onready var language_portuguese_position = languageText.get_position()

# Nodes e assets para mexer no texto "English"/"Inglês"
onready var englishText = get_node("/root/Node2D/englishStaticBody2D/english")
var base_english_text_on = preload("res://Assets/Sprites/OptionsScreen/Texts/English/English.png")
var base_english_text_off = preload("res://Assets/Sprites/OptionsScreen/Texts/Pt-Br/Ingles.png")
var hover_english_text_on = preload("res://Assets/Sprites/OptionsScreen/Texts/English/English(v2).png")
var hover_english_text_off = preload("res://Assets/Sprites/OptionsScreen/Texts/Pt-Br/Ingles(v2).png")

# Nodes e assets para mexer no texto "Portuguese"/"Português"
onready var portugueseText = get_node("/root/Node2D/portugueseStaticBody2D/portuguese")
var base_portuguese_text_on = preload("res://Assets/Sprites/OptionsScreen/Texts/Pt-Br/Portugues.png")
var base_portuguese_text_off = preload("res://Assets/Sprites/OptionsScreen/Texts/English/Portuguese.png")
var hover_portuguese_text_on = preload("res://Assets/Sprites/OptionsScreen/Texts/Pt-Br/Portugues(v2).png")
var hover_portuguese_text_off = preload("res://Assets/Sprites/OptionsScreen/Texts/English/Portuguese(v2).png")

# Nodes para mexer nos textos "Sound Effects"/"Efeitos Sonoros", "Back/Voltar" e "Music"/"Música"
onready var sound_effects = get_node("/root/Node2D/soundEffects")
onready var backText = get_node("/root/Node2D/backStaticBody2D")
onready var music = get_node("/root/Node2D/music")


#Chama função para ver em qual idioma os sprites devem ser exibido
func _ready():
	language()
	language_portuguese_position.x +=1.6
	options_portuguese_position.y-=0.38


#Alterando o idioma do label "Options"/"Opções", "Language"/"idioma", "English"/"Inglês", "Portuguese"/"Português"
# com base nas configurações definidas
func language():
	if(configuration.language_english == false):
		optionsText.set_texture(options_port)
		optionsText.set_position(options_portuguese_position)
		languageText.set_texture(language_port)
		languageText.set_position(language_portuguese_position)
		englishText.set_texture(base_english_text_off)
		portugueseText.set_texture(base_portuguese_text_on)


#Mouse clicando no idioma em inglês
func _on_englishStaticBody2D_input_event(viewport, event, shape_idx):
	if(event is InputEventMouseButton):
		if(event.button_index == 1): 
			optionsText.set_texture(options_english)
			optionsText.set_position(options_english_position)
			languageText.set_texture(language_english)
			languageText.set_position(language_english_position)
			englishText.set_texture(hover_english_text_on)
			portugueseText.set_texture(base_portuguese_text_off)
			backText.language()
			configuration.engli()
			pineapple.language()
			tomato.language()
			pepper.language()
			cucumber.language()
			banana.language()
			sound_effects.language()
			music.language()


#Mouse entrando no texto "inglês"/"english"
func _on_englishStaticBody2D_mouse_entered():
	if(configuration.language_english == true):
		englishText.set_texture(hover_english_text_on)
	else:
		englishText.set_texture(hover_english_text_off)


#Mouse saindo do texto "inglês"/"english"
func _on_englishStaticBody2D_mouse_exited():
	if(configuration.language_english == true):
		englishText.set_texture(base_english_text_on)
	else:
		englishText.set_texture(base_english_text_off)


#Mouse clicando no idioma em portugês
func _on_portugueseStaticBody2D_input_event(viewport, event, shape_idx):
	if(event is InputEventMouseButton):
		if(event.button_index == 1): 
			optionsText.set_texture(options_port)
			optionsText.set_position(options_portuguese_position)
			languageText.set_texture(language_port)
			languageText.set_position(language_portuguese_position)
			englishText.set_texture(base_english_text_off)
			portugueseText.set_texture(hover_portuguese_text_on)
			backText.language()
			configuration.port()
			pineapple.language()
			tomato.language()
			pepper.language()
			cucumber.language()
			banana.language()
			sound_effects.language()
			music.language()


#Mouse entrando no texto "portugues"/"portuguese"
func _on_portugueseStaticBody2D_mouse_entered():
	if(configuration.language_english == false):
		portugueseText.set_texture(hover_portuguese_text_on)
	else:
		portugueseText.set_texture(hover_portuguese_text_off)


#Mouse saindo do texto "portugues"/"portuguese"
func _on_portugueseStaticBody2D_mouse_exited():
	if(configuration.language_english == false):
		portugueseText.set_texture(base_portuguese_text_on)
	else:
		portugueseText.set_texture(base_portuguese_text_off)