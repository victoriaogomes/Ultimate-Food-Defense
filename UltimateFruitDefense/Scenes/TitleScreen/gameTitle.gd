extends Sprite

#Pega o asset necessário para trocar o label desse sprite para português
var port_title = preload("res://Assets/Sprites/TitleScreen/Texts/Pt-Br/Defesa final dos alimentos.png")

#Verifica se o idioma definido no sistema é português e, caso seja, troca o label para português
func _ready():
	if(configuration.language_english == false):
		self.set_texture(port_title)
