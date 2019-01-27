extends Sprite

#Carregando assets para mexer no sprite "On"/"Lig."
var base_english_on_text_on = preload("res://assets/sprites/optionsScreen/texts/English/On.png")
var base_english_on_text_off = preload("res://assets/sprites/optionsScreen/texts/English/On(v3).png")
var base_port_on_text_on = preload("res://assets/sprites/optionsScreen/texts/Pt-Br/Lig.png")
var base_port_on_text_off = preload("res://assets/sprites/optionsScreen/texts/Pt-Br/Lig(v3).png")
var hover_english_on_text_on = preload("res://assets/sprites/optionsScreen/texts/English/On(v2).png")
var hover_english_on_text_off = preload("res://assets/sprites/optionsScreen/texts/English/On(v4).png")
var hover_port_on_text_on = preload("res://assets/sprites/optionsScreen/texts/Pt-Br/Lig(v2).png")
var hover_port_on_text_off = preload("res://assets/sprites/optionsScreen/texts/Pt-Br/Lig(v4).png")

#Carregando assets para mexer no sprite "Off"/"Des."
var base_port_off_text_on = preload("res://assets/sprites/optionsScreen/texts/Pt-Br/Des.png")
var base_port_off_text_off = preload("res://assets/sprites/optionsScreen/texts/Pt-Br/Des(v3).png")
var base_english_off_text_on = preload("res://assets/sprites/optionsScreen/texts/English/Off.png")
var base_english_off_text_off = preload("res://assets/sprites/optionsScreen/texts/English/Off(v3).png")
var hover_port_off_text_on = preload("res://assets/sprites/optionsScreen/texts/Pt-Br/Des(v2).png")
var hover_port_off_text_off = preload("res://assets/sprites/optionsScreen/texts/Pt-Br/Des(v4).png")
var hover_english_off_text_on = preload("res://assets/sprites/optionsScreen/texts/English/Off(v2).png")
var hover_english_off_text_off = preload("res://assets/sprites/optionsScreen/texts/English/Off(v4).png")

#Carregando assets para mexer no sprite "Music"
var music_english = preload("res://assets/sprites/optionsScreen/texts/English/Music.png")
var music_port = preload("res://assets/sprites/optionsScreen/texts/Pt-Br/Musica.png")

onready var music_english_position = self.get_position()
onready var music_portuguese_position = self.get_position()


#Chama função para ver em qual idioma os sprites devem ser exibido
func _ready():
	configuration.connect("language_changed", self, "language")
	music_portuguese_position.x +=0.6


#Alterando o idioma do label "Off"/"Des.", "On"/"Lig." e "Music"/"Música" com base nas configurações definidas
func language():
	if(configuration.music):
		if(configuration.language_english):
			$on.set_normal_texture(base_english_on_text_on)
			$on.set_hover_texture(hover_english_on_text_on)
			$off.set_normal_texture(base_english_off_text_off)
			$off.set_hover_texture(hover_english_off_text_off)
			self.set_texture(music_port)
			self.set_position(music_portuguese_position)
		else:
			$on.set_normal_texture(base_port_on_text_on)
			$on.set_hover_texture(hover_port_on_text_on)
			$off.set_normal_texture(base_port_off_text_off)
			$off.set_hover_texture(hover_port_off_text_off)
			self.set_texture(music_english)
			self.set_position(music_english_position)
	else:
		if(configuration.language_english):
			$on.set_normal_texture(base_english_on_text_off)
			$on.set_hover_texture(hover_english_on_text_off)
			$off.set_normal_texture(base_english_off_text_on)
			$off.set_hover_texture(hover_english_off_text_on)
			self.set_texture(music_port)
			self.set_position(music_portuguese_position)
		else:
			$on.set_normal_texture(base_port_on_text_off)
			$on.set_hover_texture(hover_port_on_text_off)
			$off.set_normal_texture(base_port_off_text_on)
			$off.set_hover_texture(hover_port_off_text_on)
			self.set_texture(music_english)
			self.set_position(music_english_position)


#Mouse clicando no "On"/"Lig" das músicas
func _on_on_pressed():
	configuration.music_on()
	if(configuration.language_english):
		$on.set_normal_texture(base_english_on_text_on)
		$on.set_hover_texture(hover_english_on_text_on)
		$off.set_normal_texture(base_english_off_text_off)
		$off.set_hover_texture(hover_english_off_text_off)
	else:
		$on.set_normal_texture(base_port_on_text_on)
		$on.set_hover_texture(hover_port_on_text_on)
		$off.set_normal_texture(base_port_off_text_off)
		$off.set_hover_texture(hover_port_off_text_off)


func _on_on_mouse_entered():
	if(configuration.sound_effects):
		configuration.mouseHover_sound.play()


#Mouse clicando no "Off"/"Deslig" das músicas
func _on_off_pressed():
	configuration.music_off()
	if(configuration.language_english):
		$on.set_normal_texture(base_english_on_text_off)
		$on.set_hover_texture(hover_english_on_text_off)
		$off.set_normal_texture(base_english_off_text_on)
		$off.set_hover_texture(hover_english_off_text_on)
	else:
		$on.set_normal_texture(base_port_on_text_off)
		$on.set_hover_texture(hover_port_on_text_off)
		$off.set_normal_texture(base_port_off_text_on)
		$off.set_hover_texture(hover_port_off_text_on)


func _on_off_mouse_entered():
	if(configuration.sound_effects):
		configuration.mouseHover_sound.play()
