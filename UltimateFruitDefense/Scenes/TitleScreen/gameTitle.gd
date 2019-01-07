extends Sprite

var port_title = preload("res://Assets/Sprites/TitleScreen/Texts/Pt-Br/Defesa final dos alimentos.png")

func _ready():
	if(idioma.english == false):
		self.set_texture(port_title)
