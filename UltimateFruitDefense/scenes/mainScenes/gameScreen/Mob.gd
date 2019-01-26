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
			var pos = Vector2(32, -16.244953)
			self.set_position(pos)
		2:
			var pos = Vector2(32, -8.985142)
			self.set_position(pos)
		3:
			var pos = Vector2(32, -2.899712)
			self.set_position(pos)
		4:
			var pos = Vector2(32, 3.612766)
			self.set_position(pos)
		5:
			var pos = Vector2(32, 10.018482)
			self.set_position(pos)


func _physics_process(delta):
	collision_info = move_and_collide(velocity*delta)
	if collision_info:
		velocity = Vector2(0,0)
		$AnimationPlayer.play("atack")

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	print("excluido")
