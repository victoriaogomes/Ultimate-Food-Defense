extends Sprite

onready var optionsText = get_node("/root/Node2D/optionsTitle")
var options_english = preload("res://Assets/Sprites/OptionsScreen/Texts/English/Options.png")
var options_port = preload("res://Assets/Sprites/OptionsScreen/Texts/Pt-Br/Opcoes.png")
var options_english_position
var options_portuguese_position

onready var languageText = get_node("/root/Node2D/language")
var language_english = preload("res://Assets/Sprites/OptionsScreen/Texts/English/Language.png")
var language_port = preload("res://Assets/Sprites/OptionsScreen/Texts/Pt-Br/Idioma.png")
var language_english_position
var language_portuguese_position

onready var englishText = get_node("/root/Node2D/englishStaticBody2D/english")
var base_english_text_on = preload("res://Assets/Sprites/OptionsScreen/Texts/English/English.png")
var base_english_text_off = preload("res://Assets/Sprites/OptionsScreen/Texts/Pt-Br/Ingles.png")
var hover_english_text_on = preload("res://Assets/Sprites/OptionsScreen/Texts/English/English(v2).png")
var hover_english_text_off = preload("res://Assets/Sprites/OptionsScreen/Texts/Pt-Br/Ingles(v2).png")
var englishOn = true

onready var portugueseText = get_node("/root/Node2D/portugueseStaticBody2D/portuguese")
var base_portuguese_text_on = preload("res://Assets/Sprites/OptionsScreen/Texts/Pt-Br/Portugues.png")
var base_portuguese_text_off = preload("res://Assets/Sprites/OptionsScreen/Texts/English/Portuguese.png")
var hover_portuguese_text_on = preload("res://Assets/Sprites/OptionsScreen/Texts/Pt-Br/Portugues(v2).png")
var hover_portuguese_text_off = preload("res://Assets/Sprites/OptionsScreen/Texts/English/Portuguese(v2).png")

onready var sound_effectsText = get_node("/root/Node2D/soundEffects")
var sound_effects_english = preload("res://Assets/Sprites/OptionsScreen/Texts/English/Sound effects.png")
var sound_effects_port = preload("res://Assets/Sprites/OptionsScreen/Texts/Pt-Br/Efeitos sonoros.png")

#############################################################################################################################

onready var onText_sound_effects = get_node("/root/Node2D/on1StaticBody2D/on")
var base_english_on_text_on = preload("res://Assets/Sprites/OptionsScreen/Texts/English/on.png")
var base_english_on_text_off = preload("res://Assets/Sprites/OptionsScreen/Texts/English/on(v3).png")
var hover_english_on_text_on = preload("res://Assets/Sprites/OptionsScreen/Texts/English/on(v2).png")
var hover_english_on_text_off = preload("res://Assets/Sprites/OptionsScreen/Texts/English/on(v4).png")

var base_port_on_text_on = preload("res://Assets/Sprites/OptionsScreen/Texts/Pt-Br/Lig.png")
var base_port_on_text_off = preload("res://Assets/Sprites/OptionsScreen/Texts/Pt-Br/Lig(v3).png")
var hover_port_on_text_on = preload("res://Assets/Sprites/OptionsScreen/Texts/Pt-Br/Lig(v2).png")
var hover_port_on_text_off = preload("res://Assets/Sprites/OptionsScreen/Texts/Pt-Br/Lig(v4).png")

var sound_effectsOn = true

onready var offText_sound_effects = get_node("/root/Node2D/off1StaticBody2D/off")
var base_english_off_text_on = preload("res://Assets/Sprites/OptionsScreen/Texts/English/off.png")
var base_english_off_text_off = preload("res://Assets/Sprites/OptionsScreen/Texts/English/off(v3).png")
var hover_english_off_text_on = preload("res://Assets/Sprites/OptionsScreen/Texts/English/off(v2).png")
var hover_english_off_text_off = preload("res://Assets/Sprites/OptionsScreen/Texts/English/off(v4).png")

var base_port_off_text_on = preload("res://Assets/Sprites/OptionsScreen/Texts/Pt-Br/Des.png")
var base_port_off_text_off = preload("res://Assets/Sprites/OptionsScreen/Texts/Pt-Br/Des(v3).png")
var hover_port_off_text_on = preload("res://Assets/Sprites/OptionsScreen/Texts/Pt-Br/Des(v2).png")
var hover_port_off_text_off = preload("res://Assets/Sprites/OptionsScreen/Texts/Pt-Br/Des(v4).png")

onready var musicText = get_node("/root/Node2D/music")
var music_english = preload("res://Assets/Sprites/OptionsScreen/Texts/English/Music.png")
var music_port = preload("res://Assets/Sprites/OptionsScreen/Texts/Pt-Br/Musica.png")
var musicOn = true

onready var backText = get_node("/root/Node2D/backStaticBody2D/back")
var base_back_english = preload("res://Assets/Sprites/OptionsScreen/Texts/English/Back.png")
var hover_back_english = preload("res://Assets/Sprites/OptionsScreen/Texts/English/Back(v2).png")
var base_back_portuguese = preload("res://Assets/Sprites/OptionsScreen/Texts/Pt-Br/Voltar.png")
var hover_back_portuguese = preload("res://Assets/Sprites/OptionsScreen/Texts/Pt-Br/Voltar(v2).png")

onready var onText_music = get_node("/root/Node2D/on2StaticBody2D2/on")
onready var offText_music = get_node("/root/Node2D/off2StaticBody2D2/off")

var home_scene = preload("res://Scenes/TitleScreen/titleScreen.tscn")

func _ready():
	language_english_position = languageText.get_position()
	language_portuguese_position = languageText.get_position()
	language_portuguese_position.x +=1.6
	options_english_position = optionsText.get_position()
	options_portuguese_position = optionsText.get_position()
	options_portuguese_position.y-=0.38

#Clicando no idioma em inglês
func _on_englishStaticBody2D_input_event(viewport, event, shape_idx):
	if(event is InputEventMouseButton):
		if(event.button_index == 1): 
			englishOn = true
			optionsText.set_texture(options_english)
			optionsText.set_position(options_english_position)
			languageText.set_texture(language_english)
			languageText.set_position(language_english_position)
			englishText.set_texture(hover_english_text_on)
			portugueseText.set_texture(base_portuguese_text_off)
			sound_effectsText.set_texture(sound_effects_english)
			musicText.set_texture(music_english)
			backText.set_texture(base_back_english)
			if(sound_effectsOn == true):
				onText_sound_effects.set_texture(base_english_on_text_on)
				offText_sound_effects.set_texture(base_english_off_text_off)
			else:
				onText_sound_effects.set_texture(base_english_on_text_off)
				offText_sound_effects.set_texture(base_english_off_text_on)
			if(musicOn == true):
				onText_music.set_texture(base_english_on_text_on)
				offText_music.set_texture(base_english_off_text_off)
			else:
				onText_music.set_texture(base_english_on_text_off)
				offText_music.set_texture(base_english_off_text_on)


#Mouse entrando no texto "inglês"/"english"
func _on_englishStaticBody2D_mouse_entered():
	if(englishOn == true):
		englishText.set_texture(hover_english_text_on)
	else:
		englishText.set_texture(hover_english_text_off)


#Mouse saindo do texto "inglês"/"english"
func _on_englishStaticBody2D_mouse_exited():
	if(englishOn == true):
		englishText.set_texture(base_english_text_on)
	else:
		englishText.set_texture(base_english_text_off)


#Clicando no idioma em portugês
func _on_portugueseStaticBody2D_input_event(viewport, event, shape_idx):
	if(event is InputEventMouseButton):
		if(event.button_index == 1): 
			englishOn = false
			optionsText.set_texture(options_port)
			optionsText.set_position(options_portuguese_position)
			languageText.set_texture(language_port)
			languageText.set_position(language_portuguese_position)
			englishText.set_texture(base_english_text_off)
			portugueseText.set_texture(hover_portuguese_text_on)
			sound_effectsText.set_texture(sound_effects_port)
			musicText.set_texture(music_port)
			backText.set_texture(base_back_portuguese)
			if(sound_effectsOn == true):
				onText_sound_effects.set_texture(base_port_on_text_on)
				offText_sound_effects.set_texture(base_port_off_text_off)
			else:
				onText_sound_effects.set_texture(base_port_on_text_off)
				offText_sound_effects.set_texture(base_port_off_text_on)
			if(musicOn == true):
				onText_music.set_texture(base_port_on_text_on)
				offText_music.set_texture(base_port_off_text_off)
			else:
				onText_music.set_texture(base_port_on_text_off)
				offText_music.set_texture(base_port_off_text_on)


#Mouse entrando no texto "portugues"/"portuguese"
func _on_portugueseStaticBody2D_mouse_entered():
	if(englishOn == false):
		portugueseText.set_texture(hover_portuguese_text_on)
	else:
		portugueseText.set_texture(hover_portuguese_text_off)


#Mouse saindo do texto "portugues"/"portuguese"
func _on_portugueseStaticBody2D_mouse_exited():
	if(englishOn == false):
		portugueseText.set_texture(base_portuguese_text_on)
	else:
		portugueseText.set_texture(base_portuguese_text_off)


#Mouse clicando no "On"/"Lig" dos efeitos musicais
func _on_on1StaticBody2D_input_event(viewport, event, shape_idx):
	if(event is InputEventMouseButton):
		if(event.button_index == 1): 
			sound_effectsOn = true


#Mouse entrando no "On"/"Lig" dos efeitos musicais
func _on_on1StaticBody2D_mouse_entered():
	if(sound_effectsOn == true):
		if(englishOn == true):
			onText_sound_effects.set_texture(hover_english_on_text_on)
		else:
			onText_sound_effects.set_texture(hover_port_on_text_on)
	else:
		if(englishOn == true):
			onText_sound_effects.set_texture(hover_english_on_text_off)
		else:
			onText_sound_effects.set_texture(hover_port_on_text_off)


#Mouse saindo do "On"/"Lig" dos efeitos musicais
func _on_on1StaticBody2D_mouse_exited():
	if(sound_effectsOn == true):
		if(englishOn == true):
			onText_sound_effects.set_texture(base_english_on_text_on)
		else:
			onText_sound_effects.set_texture(base_port_on_text_on)
	else:
		if(englishOn == true):
			onText_sound_effects.set_texture(base_english_on_text_off)
		else:
			onText_sound_effects.set_texture(base_port_on_text_off)


#Mouse clicando no "Off"/"Deslig" dos efeitos musicais
func _on_off1StaticBody2D_input_event(viewport, event, shape_idx):
	if(event is InputEventMouseButton):
		if(event.button_index == 1): 
			sound_effectsOn = false


#Mouse entrando no "Off"/"Deslig" dos efeitos musicais
func _on_off1StaticBody2D_mouse_entered():
	if(sound_effectsOn == false):
		if(englishOn == true):
			offText_sound_effects.set_texture(hover_english_off_text_on)
		else:
			offText_sound_effects.set_texture(hover_port_off_text_on)
	else:
		if(englishOn == true):
			offText_sound_effects.set_texture(hover_english_off_text_off)
		else:
			offText_sound_effects.set_texture(hover_port_off_text_off)


#Mouse saindo no "Off"/"Deslig" dos efeitos musicais
func _on_off1StaticBody2D_mouse_exited():
	if(sound_effectsOn == true):
		if(englishOn == true):
			offText_sound_effects.set_texture(base_english_off_text_off)
		else:
			offText_sound_effects.set_texture(base_port_off_text_off)
	else:
		if(englishOn == true):
			offText_sound_effects.set_texture(base_english_off_text_on)
		else:
			offText_sound_effects.set_texture(base_port_off_text_on)


#Mouse clicando no "On"/"Lig" das músicas
func _on_on2StaticBody2D2_input_event(viewport, event, shape_idx):
	pass # replace with function body


#Mouse entrando no "On"/"Lig" das músicas
func _on_on2StaticBody2D2_mouse_entered():
	if(musicOn == true):
		if(englishOn == true):
			onText_music.set_texture(hover_english_on_text_on)
		else:
			onText_music.set_texture(hover_port_on_text_on)
	else:
		if(englishOn == true):
			onText_music.set_texture(hover_english_on_text_off)
		else:
			onText_music.set_texture(hover_port_on_text_off)


#Mouse saindo do "On"/"Lig" das músicas
func _on_on2StaticBody2D2_mouse_exited():
	if(musicOn == true):
		if(englishOn == true):
			onText_music.set_texture(base_english_on_text_on)
		else:
			onText_music.set_texture(base_port_on_text_on)
	else:
		if(englishOn == true):
			onText_music.set_texture(base_english_on_text_off)
		else:
			onText_music.set_texture(base_port_on_text_off)
		

#Mouse clicando no "Off"/"Deslig" das músicas
func _on_off2StaticBody2D2_input_event(viewport, event, shape_idx):
	pass # replace with function body
	

#Mouse entrando no "Off"/"Deslig" das músicas
func _on_off2StaticBody2D2_mouse_entered():
	if(musicOn == false):
		if(englishOn == true):
			offText_music.set_texture(hover_english_off_text_on)
		else:
			offText_music.set_texture(hover_port_off_text_on)
	else:
		if(englishOn == true):
			offText_music.set_texture(hover_english_off_text_off)
		else:
			offText_music.set_texture(hover_port_off_text_off)


#Mouse saindo do "Off"/"Deslig" das músicas
func _on_off2StaticBody2D2_mouse_exited():
	if(musicOn == true):
		if(englishOn == true):
			offText_music.set_texture(base_english_off_text_off)
		else:
			offText_music.set_texture(base_port_off_text_off)
	else:
		if(englishOn == true):
			offText_music.set_texture(base_english_off_text_on)
		else:
			offText_music.set_texture(base_port_off_text_on)


#Mouse clicando no botão "back"/"voltar"
func _on_backStaticBody2D_input_event(viewport, event, shape_idx):
	if(event is InputEventMouseButton):
		if(event.button_index == 1): 
			get_tree().change_scene_to(home_scene)


#Mouse entrando no botão "back"/"voltar"
func _on_backStaticBody2D_mouse_entered():
	if(englishOn==true):
		backText.set_texture(hover_back_english)
	else:
		backText.set_texture(hover_back_portuguese)


#Mouse saindo do botão "back"/"voltar"
func _on_backStaticBody2D_mouse_exited():
	if(englishOn == true):
		backText.set_texture(base_back_english)
	else:
		backText.set_texture(base_back_portuguese)