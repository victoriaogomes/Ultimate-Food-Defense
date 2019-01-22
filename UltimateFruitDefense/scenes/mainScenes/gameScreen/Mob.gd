extends KinematicBody2D

var select
var velocity = Vector2(-150, 0)

func _ready():
	self.set_process(true)
	self.set_physics_process(true)
	select = randi()%5+1
	#print(selec)
	match(select):
		1:
			var pos = Vector2(600, 95)
			self.set_position(pos)
		2:
			var pos = Vector2(600, 162)
			self.set_position(pos)
		3:
			var pos = Vector2(600, 220)
			self.set_position(pos)
		4:
			var pos = Vector2(600, 288)
			self.set_position(pos)
		5:
			var pos = Vector2(600, 150)
			self.set_position(pos)


func _physics_process(delta):
	#var pos = self.get_position()
	#pos.x -=1
	#self.set_position(pos)
	var collision_info = move_and_collide(velocity*delta)
	if collision_info:
		velocity = Vector2(0,0)


#func _process(delta):
	#var pos = self.get_position()
	#pos.x -=1
	#self.set_position(pos)
