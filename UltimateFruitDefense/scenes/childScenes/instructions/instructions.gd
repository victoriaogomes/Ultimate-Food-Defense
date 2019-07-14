extends Node2D

var english_instrucoes
var port_instrucoes
var pos = 0

var previousScene = load("res://scenes/mainScenes/titleScreen/titleScreen.tscn")

var nextBase_port = preload("res://assets/sprites/instructions/pt-Br/Proximo.png")
var nextHover_port = preload("res://assets/sprites/instructions/pt-Br/Proximo(v2).png")
var nextBase_eng = preload("res://assets/sprites/instructions/english/Next.png")
var nextHover_eng = preload("res://assets/sprites/instructions/english/Next(v2).png")

var previousBase_port = preload("res://assets/sprites/instructions/pt-Br/Anterior.png")
var previousHover_port = preload("res://assets/sprites/instructions/pt-Br/Anterior(v2).png")
var previousBase_eng = preload("res://assets/sprites/instructions/english/Previous.png")
var previousHover_eng = preload("res://assets/sprites/instructions/english/Previous(v2).png")


var mainMenuBase_port = preload("res://assets/sprites/instructions/pt-Br/MenuInicial.png")
var mainMenuHover_port = preload("res://assets/sprites/instructions/pt-Br/MenuInicial(v2).png")
var mainMenuBase_eng = preload("res://assets/sprites/instructions/english/MainMenu.png")
var mainMenuHover_eng = preload("res://assets/sprites/instructions/english/MainMenu(v2).png")


func _ready():
	if(OS.get_name() == "Android"):
		$shot.set_visible(true)
		$upButton.set_visible(true)
		$downButton.set_visible(true)
		english_instrucoes = [preload("res://assets/sprites/instructions/english/1.png"), preload("res://assets/sprites/instructions/english/2.png"), preload("res://assets/sprites/instructions/english/3.png"), preload("res://assets/sprites/instructions/english/4.png"), preload("res://assets/sprites/instructions/english/5.png"), preload("res://assets/sprites/instructions/english/6.png"), preload("res://assets/sprites/instructions/english/7.png"), preload("res://assets/sprites/instructions/english/8.png"), preload("res://assets/sprites/instructions/english/9.png"), preload("res://assets/sprites/instructions/english/10.png"), preload("res://assets/sprites/instructions/english/11.png")]
		port_instrucoes = [preload("res://assets/sprites/instructions/pt-Br/1.png"), preload("res://assets/sprites/instructions/pt-Br/2.png"), preload("res://assets/sprites/instructions/pt-Br/3.png"), preload("res://assets/sprites/instructions/pt-Br/4.png"), preload("res://assets/sprites/instructions/pt-Br/5.png"), preload("res://assets/sprites/instructions/pt-Br/6.png"), preload("res://assets/sprites/instructions/pt-Br/7.png"), preload("res://assets/sprites/instructions/pt-Br/8.png"), preload("res://assets/sprites/instructions/pt-Br/9.png"), preload("res://assets/sprites/instructions/pt-Br/10.png"), preload("res://assets/sprites/instructions/pt-Br/11.png")]
	else:
		english_instrucoes = [preload("res://assets/sprites/instructions/english/1.png"), preload("res://assets/sprites/instructions/english/2.png"), preload("res://assets/sprites/instructions/english/12.png"), preload("res://assets/sprites/instructions/english/13.png"), preload("res://assets/sprites/instructions/english/5.png"), preload("res://assets/sprites/instructions/english/6.png"), preload("res://assets/sprites/instructions/english/7.png"), preload("res://assets/sprites/instructions/english/8.png"), preload("res://assets/sprites/instructions/english/9.png"), preload("res://assets/sprites/instructions/english/10.png"), preload("res://assets/sprites/instructions/english/11.png")]
		port_instrucoes = [preload("res://assets/sprites/instructions/pt-Br/1.png"), preload("res://assets/sprites/instructions/pt-Br/2.png"), preload("res://assets/sprites/instructions/pt-Br/12.png"), preload("res://assets/sprites/instructions/pt-Br/13.png"),  preload("res://assets/sprites/instructions/pt-Br/5.png"), preload("res://assets/sprites/instructions/pt-Br/6.png"), preload("res://assets/sprites/instructions/pt-Br/7.png"), preload("res://assets/sprites/instructions/pt-Br/8.png"), preload("res://assets/sprites/instructions/pt-Br/9.png"), preload("res://assets/sprites/instructions/pt-Br/10.png"), preload("res://assets/sprites/instructions/pt-Br/11.png")]
		$shot.set_visible(false)
		$upButton.set_visible(false)
		$downButton.set_visible(false)
	set_image()
	$previous.set_visible(false)
	if(configuration.language_english):
		$next.set_normal_texture(nextBase_eng)
		$next.set_hover_texture(nextHover_eng)
		$previous.set_normal_texture(previousBase_eng)
		$previous.set_hover_texture(previousHover_eng)
		$mainMenu.set_normal_texture(mainMenuBase_eng)
		$mainMenu.set_hover_texture(mainMenuHover_eng)
	else:
		$next.set_normal_texture(nextBase_port)
		$next.set_hover_texture(nextHover_port)
		$previous.set_normal_texture(previousBase_port)
		$previous.set_hover_texture(previousHover_port)
		$mainMenu.set_normal_texture(mainMenuBase_port)
		$mainMenu.set_hover_texture(mainMenuHover_port)


func _on_next_pressed():
	pos+=1
	if(OS.get_name() == "Android"):
		if(pos == 3):
			$shot.set_visible(false)
			$upButton.set_visible(true)
			$downButton.set_visible(true)
		elif(pos == 4):
			$shot.set_visible(true)
			$upButton.set_visible(false)
			$downButton.set_visible(false)
		elif(pos):
			$shot.set_visible(true)
			$upButton.set_visible(true)
			$downButton.set_visible(true)
	if(pos==10):
		$next.set_visible(false)
		$previous.set_visible(true)
	else:
		$next.set_visible(true)
		$previous.set_visible(true)
	set_image()


func _on_previous_pressed():
	pos-=1
	if(OS.get_name() == "Android"):
		if(pos == 3):
			$shot.set_visible(false)
			$upButton.set_visible(true)
			$downButton.set_visible(true)
		elif(pos == 4):
			$shot.set_visible(true)
			$upButton.set_visible(false)
			$downButton.set_visible(false)
		elif(pos):
			$shot.set_visible(true)
			$upButton.set_visible(true)
			$downButton.set_visible(true)
	if(pos == 0):
		$previous.set_visible(false)
	else:
		$previous.set_visible(true)
	set_image()


func set_image():
	if(configuration.language_english):
		$instro.set_texture(english_instrucoes[pos])
	else:
		$instro.set_texture(port_instrucoes[pos])


func _on_next_mouse_entered():
	if(configuration.sound_effects):
		configuration.mouseHover_sound.play()


func _on_previous_mouse_entered():
	if(configuration.sound_effects):
		configuration.mouseHover_sound.play()


func _on_mainMenu_pressed():
	get_tree().change_scene_to(previousScene)


func _on_mainMenu_mouse_entered():
	if(configuration.sound_effects):
		configuration.mouseHover_sound.play()
