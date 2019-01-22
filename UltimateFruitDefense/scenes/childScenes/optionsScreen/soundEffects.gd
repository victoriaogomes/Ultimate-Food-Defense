extends Sprite

#Carregando nodes e assets para mexer no sprite "On"/"Lig."
onready var onText_sound_effects = get_node("../soundEffects/soundEffects_onStaticBody2D/on")
var base_english_on_text_on = preload("res://Assets/Sprites/OptionsScreen/Texts/English/on.png")
var base_english_on_text_off = preload("res://Assets/Sprites/OptionsScreen/Texts/English/on(v3).png")
var base_port_on_text_on = preload("res://Assets/Sprites/OptionsScreen/Texts/Pt-Br/Lig.png")
var base_port_on_text_off = preload("res://Assets/Sprites/OptionsScreen/Texts/Pt-Br/Lig(v3).png")
var hover_english_on_text_on = preload("res://Assets/Sprites/OptionsScreen/Texts/English/on(v2).png")
var hover_english_on_text_off = preload("res://Assets/Sprites/OptionsScreen/Texts/English/on(v4).png")
var hover_port_on_text_on = preload("res://Assets/Sprites/OptionsScreen/Texts/Pt-Br/Lig(v2).png")
var hover_port_on_text_off = preload("res://Assets/Sprites/OptionsScreen/Texts/Pt-Br/Lig(v4).png")

#Carregando nodes e assets para mexer no sprite "Off"/"Des."
onready var offText_sound_effects = get_node("../soundEffects/soundEffects_offStaticBody2D/off")
var base_port_off_text_on = preload("res://Assets/Sprites/OptionsScreen/Texts/Pt-Br/Des.png")
var base_port_off_text_off = preload("res://Assets/Sprites/OptionsScreen/Texts/Pt-Br/Des(v3).png")
var base_english_off_text_on = preload("res://Assets/Sprites/OptionsScreen/Texts/English/off.png")
var base_english_off_text_off = preload("res://Assets/Sprites/OptionsScreen/Texts/English/off(v3).png")
var hover_port_off_text_on = preload("res://Assets/Sprites/OptionsScreen/Texts/Pt-Br/Des(v2).png")
var hover_port_off_text_off = preload("res://Assets/Sprites/OptionsScreen/Texts/Pt-Br/Des(v4).png")
var hover_english_off_text_on = preload("res://Assets/Sprites/OptionsScreen/Texts/English/off(v2).png")
var hover_english_off_text_off = preload("res://Assets/Sprites/OptionsScreen/Texts/English/off(v4).png")

#Carregando nodes e assets para mexer no sprite "Sound Effects"
onready var sound_effects = get_node("../soundEffects")
var sound_effects_english = preload("res://Assets/Sprites/OptionsScreen/Texts/English/Sound effects.png")
var sound_effects_port = preload("res://Assets/Sprites/OptionsScreen/Texts/Pt-Br/Efeitos sonoros.png")

onready var soundEffects_english_position = sound_effects.get_position()
onready var soundEffects_portuguese_position = sound_effects.get_position()


#Chama função para ver em qual idioma os sprites devem ser exibido
func _ready():
	language()
	soundEffects_portuguese_position.x +=0.9


#Alterando o idioma do label "Off/Des.", "On/Lig." e "Sound effects/Efeitos sonoros" com base nas configurações definidas
func language():
	if(configuration.sound_effects == true):
		if(!configuration.language_english):
			onText_sound_effects.set_texture(base_port_on_text_on)
			offText_sound_effects.set_texture(base_port_off_text_off)
			sound_effects.set_texture(sound_effects_port)
			sound_effects.set_position(soundEffects_portuguese_position)
		else:
			onText_sound_effects.set_texture(base_english_on_text_on)
			offText_sound_effects.set_texture(base_english_off_text_off)
			sound_effects.set_texture(sound_effects_english)
			sound_effects.set_position(soundEffects_english_position)
	else:
		if(!configuration.language_english):
			onText_sound_effects.set_texture(base_port_on_text_off)
			offText_sound_effects.set_texture(base_port_off_text_on)
			sound_effects.set_texture(sound_effects_port)
			sound_effects.set_position(soundEffects_portuguese_position)
		else:
			onText_sound_effects.set_texture(base_english_on_text_off)
			offText_sound_effects.set_texture(base_english_off_text_on)
			sound_effects.set_texture(sound_effects_english)
			sound_effects.set_position(soundEffects_english_position)


#Mouse clicando no "On"/"Lig" dos efeitos musicais
func _on_soundEffects_onStaticBody2D_input_event(viewport, event, shape_idx):
	if(Input.is_mouse_button_pressed(BUTTON_LEFT)):
		configuration.sound_effects_on()
		if(configuration.language_english):
			onText_sound_effects.set_texture(hover_english_on_text_on)
			offText_sound_effects.set_texture(base_english_off_text_off)
		else:
			onText_sound_effects.set_texture(hover_port_on_text_on)
			offText_sound_effects.set_texture(base_port_off_text_off)


#Mouse entrando no "On"/"Lig" dos efeitos musicais
func _on_soundEffects_onStaticBody2D_mouse_entered():
	if(configuration.sound_effects):
		configuration.mouseHover_sound.play()
	if(configuration.sound_effects):
		if(configuration.language_english):
			onText_sound_effects.set_texture(hover_english_on_text_on)
		else:
			onText_sound_effects.set_texture(hover_port_on_text_on)
	else:
		if(configuration.language_english):
			onText_sound_effects.set_texture(hover_english_on_text_off)
		else:
			onText_sound_effects.set_texture(hover_port_on_text_off)


#Mouse saindo do "On"/"Lig" dos efeitos musicais
func _on_soundEffects_onStaticBody2D_mouse_exited():
	if(configuration.sound_effects):
		if(configuration.language_english):
			onText_sound_effects.set_texture(base_english_on_text_on)
		else:
			onText_sound_effects.set_texture(base_port_on_text_on)
	else:
		if(configuration.language_english):
			onText_sound_effects.set_texture(base_english_on_text_off)
		else:
			onText_sound_effects.set_texture(base_port_on_text_off)


#Mouse clicando no "Off"/"Deslig" dos efeitos musicais
func _on_soundEffects_offStaticBody2D_input_event(viewport, event, shape_idx):
	if(Input.is_mouse_button_pressed(BUTTON_LEFT)):
		configuration.sound_effects_off()
		if(configuration.language_english):
			onText_sound_effects.set_texture(base_english_on_text_off)
			offText_sound_effects.set_texture(hover_english_off_text_on)
		else:
			onText_sound_effects.set_texture(base_port_on_text_off)
			offText_sound_effects.set_texture(hover_port_off_text_on)


#Mouse entrando no "Off"/"Deslig" dos efeitos musicais
func _on_soundEffects_offStaticBody2D_mouse_entered():
	if(configuration.sound_effects):
		configuration.mouseHover_sound.play()
	if(configuration.sound_effects):
		if(configuration.language_english):
			offText_sound_effects.set_texture(hover_english_off_text_on)
		else:
			offText_sound_effects.set_texture(hover_port_off_text_on)
	else:
		if(configuration.language_english):
			offText_sound_effects.set_texture(hover_english_off_text_off)
		else:
			offText_sound_effects.set_texture(hover_port_off_text_off)


#Mouse saindo no "Off"/"Deslig" dos efeitos musicais
func _on_soundEffects_offStaticBody2D_mouse_exited():
	if(configuration.sound_effects):
		if(configuration.language_english):
			offText_sound_effects.set_texture(base_english_off_text_off)
		else:
			offText_sound_effects.set_texture(base_port_off_text_off)
	else:
		if(configuration.language_english):
			offText_sound_effects.set_texture(base_english_off_text_on)
		else:
			offText_sound_effects.set_texture(base_port_off_text_on)