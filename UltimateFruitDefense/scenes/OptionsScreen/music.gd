extends Sprite

#Carregando nodes e assets para mexer no sprite "On"/"Lig."
onready var onText_music = get_node("/root/Node2D/music/on_musicStaticBody2D2/on")
var base_english_on_text_on = preload("res://Assets/Sprites/OptionsScreen/Texts/English/on.png")
var base_english_on_text_off = preload("res://Assets/Sprites/OptionsScreen/Texts/English/on(v3).png")
var base_port_on_text_on = preload("res://Assets/Sprites/OptionsScreen/Texts/Pt-Br/Lig.png")
var base_port_on_text_off = preload("res://Assets/Sprites/OptionsScreen/Texts/Pt-Br/Lig(v3).png")
var hover_english_on_text_on = preload("res://Assets/Sprites/OptionsScreen/Texts/English/on(v2).png")
var hover_english_on_text_off = preload("res://Assets/Sprites/OptionsScreen/Texts/English/on(v4).png")
var hover_port_on_text_on = preload("res://Assets/Sprites/OptionsScreen/Texts/Pt-Br/Lig(v2).png")
var hover_port_on_text_off = preload("res://Assets/Sprites/OptionsScreen/Texts/Pt-Br/Lig(v4).png")

#Carregando nodes e assets para mexer no sprite "Off"/"Des."
onready var offText_music = get_node("/root/Node2D/music/off_musicStaticBody2D2/off")
var base_port_off_text_on = preload("res://Assets/Sprites/OptionsScreen/Texts/Pt-Br/Des.png")
var base_port_off_text_off = preload("res://Assets/Sprites/OptionsScreen/Texts/Pt-Br/Des(v3).png")
var base_english_off_text_on = preload("res://Assets/Sprites/OptionsScreen/Texts/English/off.png")
var base_english_off_text_off = preload("res://Assets/Sprites/OptionsScreen/Texts/English/off(v3).png")
var hover_port_off_text_on = preload("res://Assets/Sprites/OptionsScreen/Texts/Pt-Br/Des(v2).png")
var hover_port_off_text_off = preload("res://Assets/Sprites/OptionsScreen/Texts/Pt-Br/Des(v4).png")
var hover_english_off_text_on = preload("res://Assets/Sprites/OptionsScreen/Texts/English/off(v2).png")
var hover_english_off_text_off = preload("res://Assets/Sprites/OptionsScreen/Texts/English/off(v4).png")

#Carregando nodes e assets para mexer no sprite "Music"
onready var music = get_node("/root/Node2D/music")
var music_english = preload("res://Assets/Sprites/OptionsScreen/Texts/English/Music.png")
var music_port = preload("res://Assets/Sprites/OptionsScreen/Texts/Pt-Br/Musica.png")


#Chama função para ver em qual idioma os sprites devem ser exibido
func _ready():
	language()


#Alterando o idioma do label "Off"/"Des.", "On"/"Lig." e "Music"/"Música" com base nas configurações definidas
func language():
	if(configuration.music == true):
		if(configuration.language_english == false):
			onText_music.set_texture(base_port_on_text_on)
			offText_music.set_texture(base_port_off_text_off)
			music.set_texture(music_port)
		else:
			onText_music.set_texture(base_english_on_text_on)
			offText_music.set_texture(base_english_off_text_off)
			music.set_texture(music_english)
	else:
		if(configuration.language_english == false):
			onText_music.set_texture(base_port_on_text_off)
			offText_music.set_texture(base_port_off_text_on)
			music.set_texture(music_port)
		else:
			onText_music.set_texture(base_english_on_text_off)
			offText_music.set_texture(base_english_off_text_on)
			music.set_texture(music_english)


#Mouse clicando no "On"/"Lig" das músicas
func _on_on_musicStaticBody2D2_input_event(viewport, event, shape_idx):
	if(event is InputEventMouseButton):
		if(event.button_index == 1): 
			configuration.music = true
			if(configuration.language_english == true):
				onText_music.set_texture(hover_english_on_text_on)
				offText_music.set_texture(base_english_off_text_off)
			else:
				onText_music.set_texture(hover_port_on_text_on)
				offText_music.set_texture(base_port_off_text_off)


#Mouse entrando no "On"/"Lig" das músicas
func _on_on_musicStaticBody2D2_mouse_entered():
	if(configuration.music == true):
		if(configuration.language_english == true):
			onText_music.set_texture(hover_english_on_text_on)
		else:
			onText_music.set_texture(hover_port_on_text_on)
	else:
		if(configuration.language_english == true):
			onText_music.set_texture(hover_english_on_text_off)
		else:
			onText_music.set_texture(hover_port_on_text_off)


#Mouse saindo do "On"/"Lig" das músicas
func _on_on_musicStaticBody2D2_mouse_exited():
	if(configuration.music == true):
		if(configuration.language_english == true):
			onText_music.set_texture(base_english_on_text_on)
		else:
			onText_music.set_texture(base_port_on_text_on)
	else:
		if(configuration.language_english == true):
			onText_music.set_texture(base_english_on_text_off)
		else:
			onText_music.set_texture(base_port_on_text_off)


#Mouse clicando no "Off"/"Deslig" das músicas
func _on_off_musicStaticBody2D2_input_event(viewport, event, shape_idx):
	if(event is InputEventMouseButton):
		if(event.button_index == 1): 
			configuration.music_off()
			if(configuration.language_english == true):
				onText_music.set_texture(base_english_on_text_off)
				offText_music.set_texture(hover_english_off_text_on)
			else:
				onText_music.set_texture(base_port_on_text_off)
				offText_music.set_texture(hover_port_off_text_on)


#Mouse entrando no "Off"/"Deslig" das músicas
func _on_off_musicStaticBody2D2_mouse_entered():
	if(configuration.music == false):
		if(configuration.language_english == true):
			offText_music.set_texture(hover_english_off_text_on)
		else:
			offText_music.set_texture(hover_port_off_text_on)
	else:
		if(configuration.language_english == true):
			offText_music.set_texture(hover_english_off_text_off)
		else:
			offText_music.set_texture(hover_port_off_text_off)


#Mouse saindo do "Off"/"Deslig" das músicas
func _on_off_musicStaticBody2D2_mouse_exited():
	if(configuration.music == true):
		if(configuration.language_english == true):
			offText_music.set_texture(base_english_off_text_off)
		else:
			offText_music.set_texture(base_port_off_text_off)
	else:
		if(configuration.language_english == true):
			offText_music.set_texture(base_english_off_text_on)
		else:
			offText_music.set_texture(base_port_off_text_on)