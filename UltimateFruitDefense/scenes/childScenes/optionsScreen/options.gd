extends Node2D

# Assets para mexer no texto "Options"/Opções"
var options_english = preload("res://assets/sprites/optionsScreen/Texts/English/Options.png")
var options_port = preload("res://assets/sprites/optionsScreen/Texts/Pt-Br/Opcoes.png")
onready var options_english_position = $optionsTitle.get_position()
onready var options_portuguese_position = $optionsTitle.get_position()

# Assets para mexer no texto "Language"/"Idioma"
var language_port = preload("res://Assets/Sprites/OptionsScreen/Texts/Pt-Br/Idioma.png")
var language_english = preload("res://Assets/Sprites/OptionsScreen/Texts/english/language.png")
onready var language_english_position = $language.get_position()
onready var language_portuguese_position = $language.get_position()

# Assets para mexer no texto "English"/"Inglês"
var base_english_text_on = preload("res://Assets/Sprites/OptionsScreen/Texts/English/English.png")
var base_english_text_off = preload("res://Assets/Sprites/OptionsScreen/Texts/Pt-Br/Ingles.png")
var hover_english_text_on = preload("res://Assets/Sprites/OptionsScreen/Texts/English/English(v2).png")
var hover_english_text_off = preload("res://Assets/Sprites/OptionsScreen/Texts/Pt-Br/Ingles(v2).png")

# Assets para mexer no texto "Portuguese"/"Português"
var base_portuguese_text_on = preload("res://Assets/Sprites/OptionsScreen/Texts/Pt-Br/Portugues.png")
var base_portuguese_text_off = preload("res://Assets/Sprites/OptionsScreen/Texts/English/Portuguese.png")
var hover_portuguese_text_on = preload("res://Assets/Sprites/OptionsScreen/Texts/Pt-Br/Portugues(v2).png")
var hover_portuguese_text_off = preload("res://Assets/Sprites/OptionsScreen/Texts/English/Portuguese(v2).png")

func _ready():
	language_portuguese_position.x -=2
	options_portuguese_position.y-=0.38
	if(configuration.language_english):
		_on_english_pressed()
	else:
		_on_portuguese_pressed()


func _on_english_pressed():
	configuration.engli()
	$optionsTitle.set_texture(options_english)
	$optionsTitle.set_position(options_english_position)
	$language.set_texture(language_english)
	$language.set_position(language_english_position)
	$english.set_normal_texture(base_english_text_on)
	$english.set_hover_texture(hover_english_text_on)
	$portuguese.set_normal_texture(base_portuguese_text_off)
	$portuguese.set_hover_texture(hover_portuguese_text_off)


func _on_portuguese_pressed():
	configuration.port()
	$optionsTitle.set_texture(options_port)
	$optionsTitle.set_position(options_portuguese_position)
	$language.set_texture(language_port)
	$language.set_position(language_portuguese_position)
	$english.set_normal_texture(base_english_text_off)
	$english.set_hover_texture(hover_english_text_off)
	$portuguese.set_normal_texture(base_portuguese_text_on)
	$portuguese.set_hover_texture(hover_portuguese_text_on)