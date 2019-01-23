extends Sprite

#Carregando assets para mexer no sprite "On"/"Lig."
var base_english_on_text_on = preload("res://assets/sprites/optionsScreen/Texts/English/on.png")
var base_english_on_text_off = preload("res://assets/sprites/optionsScreen/Texts/English/on(v3).png")
var base_port_on_text_on = preload("res://assets/sprites/optionsScreen/Texts/Pt-Br/Lig.png")
var base_port_on_text_off = preload("res://assets/sprites/optionsScreen/Texts/Pt-Br/Lig(v3).png")
var hover_english_on_text_on = preload("res://assets/sprites/optionsScreen/Texts/English/on(v2).png")
var hover_english_on_text_off = preload("res://assets/sprites/optionsScreen/Texts/English/on(v4).png")
var hover_port_on_text_on = preload("res://assets/sprites/optionsScreen/Texts/Pt-Br/Lig(v2).png")
var hover_port_on_text_off = preload("res://assets/sprites/optionsScreen/Texts/Pt-Br/Lig(v4).png")

#Carregando assets para mexer no sprite "Off"/"Des."
var base_port_off_text_on = preload("res://assets/sprites/optionsScreen/Texts/Pt-Br/Des.png")
var base_port_off_text_off = preload("res://assets/sprites/optionsScreen/Texts/Pt-Br/Des(v3).png")
var base_english_off_text_on = preload("res://assets/sprites/optionsScreen/Texts/English/off.png")
var base_english_off_text_off = preload("res://assets/sprites/optionsScreen/Texts/English/off(v3).png")
var hover_port_off_text_on = preload("res://assets/sprites/optionsScreen/Texts/Pt-Br/Des(v2).png")
var hover_port_off_text_off = preload("res://assets/sprites/optionsScreen/Texts/Pt-Br/Des(v4).png")
var hover_english_off_text_on = preload("res://assets/sprites/optionsScreen/Texts/English/off(v2).png")
var hover_english_off_text_off = preload("res://assets/sprites/optionsScreen/Texts/English/off(v4).png")

#Carregando assets para mexer no sprite "Music"
var music_english = preload("res://Assets/Sprites/OptionsScreen/Texts/English/Music.png")
var music_port = preload("res://Assets/Sprites/OptionsScreen/Texts/Pt-Br/Musica.png")

onready var music_english_position = self.get_position()
onready var music_portuguese_position = self.get_position()


#Chama função para ver em qual idioma os sprites devem ser exibido
func _ready():
	language()
	music_portuguese_position.x +=0.6


#Alterando o idioma do label "Off"/"Des.", "On"/"Lig." e "Music"/"Música" com base nas configurações definidas
func language():
	if(configuration.music):
		if(!configuration.language_english):
			$on_musicStaticBody2D2/on.set_texture(base_port_on_text_on)
			$off_musicStaticBody2D2/off.set_texture(base_port_off_text_off)
			self.set_texture(music_port)
			self.set_position(music_portuguese_position)
		else:
			$on_musicStaticBody2D2/on.set_texture(base_english_on_text_on)
			$off_musicStaticBody2D2/off.set_texture(base_english_off_text_off)
			self.set_texture(music_english)
			self.set_position(music_english_position)
	else:
		if(!configuration.language_english):
			$on_musicStaticBody2D2/on.set_texture(base_port_on_text_off)
			$off_musicStaticBody2D2/off.set_texture(base_port_off_text_on)
			self.set_texture(music_port)
			self.set_position(music_portuguese_position)
		else:
			$on_musicStaticBody2D2/on.set_texture(base_english_on_text_off)
			$off_musicStaticBody2D2/off.set_texture(base_english_off_text_on)
			self.set_texture(music_english)
			self.set_position(music_english_position)


#Mouse clicando no "On"/"Lig" das músicas
func _on_on_musicStaticBody2D2_input_event(viewport, event, shape_idx):
	if(Input.is_mouse_button_pressed(BUTTON_LEFT)):
		configuration.music_on()
		if(configuration.language_english):
			$on_musicStaticBody2D2/on.set_texture(hover_english_on_text_on)
			$off_musicStaticBody2D2/off.set_texture(base_english_off_text_off)
		else:
			$on_musicStaticBody2D2/on.set_texture(hover_port_on_text_on)
			$off_musicStaticBody2D2/off.set_texture(base_port_off_text_off)


#Mouse entrando no "On"/"Lig" das músicas
func _on_on_musicStaticBody2D2_mouse_entered():
	if(configuration.sound_effects):
		configuration.mouseHover_sound.play()
	if(configuration.music):
		if(configuration.language_english):
			$on_musicStaticBody2D2/on.set_texture(hover_english_on_text_on)
		else:
			$on_musicStaticBody2D2/on.set_texture(hover_port_on_text_on)
	else:
		if(configuration.language_english):
			$on_musicStaticBody2D2/on.set_texture(hover_english_on_text_off)
		else:
			$on_musicStaticBody2D2/on.set_texture(hover_port_on_text_off)


#Mouse saindo do "On"/"Lig" das músicas
func _on_on_musicStaticBody2D2_mouse_exited():
	if(configuration.music):
		if(configuration.language_english):
			$on_musicStaticBody2D2/on.set_texture(base_english_on_text_on)
		else:
			$on_musicStaticBody2D2/on.set_texture(base_port_on_text_on)
	else:
		if(configuration.language_english):
			$on_musicStaticBody2D2/on.set_texture(base_english_on_text_off)
		else:
			$on_musicStaticBody2D2/on.set_texture(base_port_on_text_off)


#Mouse clicando no "Off"/"Deslig" das músicas
func _on_off_musicStaticBody2D2_input_event(viewport, event, shape_idx):
	if(Input.is_mouse_button_pressed(BUTTON_LEFT)):
		configuration.music_off()
		if(configuration.language_english):
			$on_musicStaticBody2D2/on.set_texture(base_english_on_text_off)
			$off_musicStaticBody2D2/off.set_texture(hover_english_off_text_on)
		else:
			$on_musicStaticBody2D2/on.set_texture(base_port_on_text_off)
			$off_musicStaticBody2D2/off.set_texture(hover_port_off_text_on)


#Mouse entrando no "Off"/"Deslig" das músicas
func _on_off_musicStaticBody2D2_mouse_entered():
	if(configuration.sound_effects):
		configuration.mouseHover_sound.play()
	if(!configuration.music):
		if(configuration.language_english):
			$off_musicStaticBody2D2/off.set_texture(hover_english_off_text_on)
		else:
			$off_musicStaticBody2D2/off.set_texture(hover_port_off_text_on)
	else:
		if(configuration.language_english):
			$off_musicStaticBody2D2/off.set_texture(hover_english_off_text_off)
		else:
			$off_musicStaticBody2D2/off.set_texture(hover_port_off_text_off)


#Mouse saindo do "Off"/"Deslig" das músicas
func _on_off_musicStaticBody2D2_mouse_exited():
	if(configuration.music):
		if(configuration.language_english):
			$off_musicStaticBody2D2/off.set_texture(base_english_off_text_off)
		else:
			$off_musicStaticBody2D2/off.set_texture(base_port_off_text_off)
	else:
		if(configuration.language_english):
			$off_musicStaticBody2D2/off.set_texture(base_english_off_text_on)
		else:
			$off_musicStaticBody2D2/off.set_texture(base_port_off_text_on)