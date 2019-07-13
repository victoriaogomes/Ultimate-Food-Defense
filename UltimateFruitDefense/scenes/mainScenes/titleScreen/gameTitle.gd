extends Sprite

#Pega o asset necessário para trocar o label desse sprite para português
var port_title = preload("res://assets/sprites/titleScreen/texts/Pt-Br/DefesaFinalDosAlimentos.png")
var english_title = preload("res://assets/sprites/titleScreen/texts/English/UltimateFruitDefense.png")

#Verifica se o idioma definido no sistema é português e, caso seja, troca o label para português
func _ready():
	#warning-ignore:return_value_discarded
	configuration.connect("language_changed", self, "language")
	language()

func language():
	if(configuration.language_english):
		self.set_texture(english_title)
	else:
		self.set_texture(port_title)
