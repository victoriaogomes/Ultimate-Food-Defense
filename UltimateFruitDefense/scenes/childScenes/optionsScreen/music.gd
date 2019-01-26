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