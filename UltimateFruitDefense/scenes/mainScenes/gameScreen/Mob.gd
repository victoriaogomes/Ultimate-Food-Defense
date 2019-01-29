extends KinematicBody2D

var select
var velocity = Vector2(-50, 0)
var collision_info
var life = 3
var shot

func _ready():
	shot = false
	$AnimationPlayer.play("walk")
	self.set_physics_process(true)
	select = randi()%5+1
	#print(selec)
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
			velocity = Vector2(0,0)
			$AnimationPlayer.play("atack")
	else:
		if(game_control.target == self):
			game_control.target = null
		queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	#game_control.target = game_control.enemies[game_control.enemies.size()-1]
	#game_control.remove_enemie(self)
	self.remove_from_group("enemies")
	queue_free()
	print("Sobraram ", get_tree().get_nodes_in_group("enemies").size(), "inimigos")
	print("excluido")


#func _on_Area2D_body_entered(body):
#	if(body.is_in_group("bullet")):
#		if(life == 0):
#			self.remove_from_group("enemies")
#			self.queue_free()
#			print("Sobraram ", get_tree().get_nodes_in_group("enemies").size(), "inimigos")
#		else:
#			print("entrei aqui")
#			life = life -1
#	print(life)
