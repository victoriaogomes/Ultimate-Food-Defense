extends KinematicBody2D

var select
var velocity = Vector2(-50, 0)
var collision_info
var life = 15
var shot

func _ready():
	shot = false
	$Timer.connect("timeout", self, "on_TimeOut")
	$AnimationPlayer.play("walk")
	self.set_physics_process(true)
	select = randi()%5+1
	match(select):
		1:
			var pos = Vector2(32, -17.443962)
			self.set_position(pos)
		2:
			var pos = Vector2(32, -11.465253)
			self.set_position(pos)
		3:
			var pos = Vector2(32, -5.486543)
			self.set_position(pos)
		4:
			var pos = Vector2(32, 1.453015)
			self.set_position(pos)
		5:
			var pos = Vector2(32, 7.538473)
			self.set_position(pos)


func _physics_process(delta):
	if(shot):
		life-=1
		shot = false
	if(life>0):
		collision_info = move_and_collide(velocity*delta)
		if collision_info:
			if(collision_info.get_collider().is_in_group("wall")):
				velocity = Vector2(0,0)
				$AnimationPlayer.play("atack")
				$Timer.start()
			else:
				move_and_slide(velocity*delta)
	else:
		game_control.beatedEnemies +=1
		if(game_control.target == self):
			game_control.target = null
		queue_free()

func on_TimeOut():
	game_control.aumentarSugarLevel()


func _on_VisibilityNotifier2D_screen_exited():
	self.remove_from_group("enemies")
	queue_free()
	#print("Sobraram ", get_tree().get_nodes_in_group("enemies").size(), "inimigos")
	#print("excluido")