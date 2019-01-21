extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	self.set_process(true)

	var selec = randi()%5+1
	print(selec)
	if(selec==1):
		var pos = Vector2(600, 95)
		self.set_position(pos)
	elif(selec==2):
		var pos = Vector2(600, 162)
		self.set_position(pos)
	elif(selec==3):
		var pos = Vector2(600, 220)
		self.set_position(pos)
	if(selec==4):
		var pos = Vector2(600, 288)
		self.set_position(pos)
	elif(selec==5):
		var pos = Vector2(600, 150)
		self.set_position(pos)
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
func _process(delta):
	var pos = self.get_position()
	pos.x -=1
	self.set_position(pos)
