extends StaticBody2D

#Carregando nodes e assets para mexer no sprites "back"
onready var backText = get_node("back")
var base_back_english = preload("res://Assets/Sprites/OptionsScreen/Texts/English/Back.png")
var hover_back_english = preload("res://Assets/Sprites/OptionsScreen/Texts/English/Back(v2).png")
var base_back_portuguese = preload("res://Assets/Sprites/OptionsScreen/Texts/Pt-Br/Voltar.png")
var hover_back_portuguese = preload("res://Assets/Sprites/OptionsScreen/Texts/Pt-Br/Voltar(v2).png")

#Carregando a tela inicial do jogo
var home_scene = preload("res://Scenes/TitleScreen/titleScreen.tscn")


#Chama a função "language" para colocar o text do sprite no idioma correto
func _ready():
	language()


#Alterando o idioma do label "back"/"voltar" com base nas configurações definidas
func language():
	if(configuration.language_english == true):
		backText.set_texture(base_back_english)
	else:
		backText.set_texture(base_back_portuguese)


#Mouse clicando no botão "back"/"voltar"
func _on_backStaticBody2D_input_event(viewport, event, shape_idx):
	if(event is InputEventMouseButton):
		if(event.button_index == 1): 
			get_tree().change_scene_to(home_scene)


#Mouse entrando no botão "back"/"voltar"
func _on_backStaticBody2D_mouse_entered():
	var sEfect = AudioStreamPlayer.new()
	self.add_child(sEfect)
	sEfect.stream = load("res://Assets/Sounds/menuSelection.wav")
	sEfect.volume_db = -25
	sEfect.play()
	if(configuration.language_english == true):
		backText.set_texture(hover_back_english)
	else:
		backText.set_texture(hover_back_portuguese)


#Mouse saindo do botão "back"/"voltar"
func _on_backStaticBody2D_mouse_exited():
	if(configuration.language_english == true):
		backText.set_texture(base_back_english)
	else:
		backText.set_texture(base_back_portuguese)