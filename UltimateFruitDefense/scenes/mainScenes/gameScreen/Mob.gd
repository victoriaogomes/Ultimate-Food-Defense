extends KinematicBody2D

var select
var velocity = Vector2(-50, 0)
var collision_info

func _ready():
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
	collision_info = move_and_collide(velocity*delta)
	if collision_info:
		velocity = Vector2(0,0)
		$AnimationPlayer.play("atack")

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	game_control.target = game_control.enemies[game_control.enemies.size()-1]
	print("excluido")

func _on_Area2D_area_entered(area):
	self.queue_free()
