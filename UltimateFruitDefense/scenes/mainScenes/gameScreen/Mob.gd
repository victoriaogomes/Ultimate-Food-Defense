extends KinematicBody2D

var select
var velocity = Vector2(-50, 0)
var collision_info
var life = 8
var shot
var startBeating

func _ready():
	shot = false
	game_control.connect("shotSomeone", self, "shotSomebody")
	startBeating = 0
	#warning-ignore:return_value_discarded
	$AnimationPlayer.connect("animation_finished", self, "_endAnimation")
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

func shotSomebody():
	if(shot):
		life-=1
		shot = false
	if(life<=0):
		game_control.beatedEnemies +=1
		if(game_control.target == self):
			game_control.target = null
		queue_free()

func _physics_process(delta):
	if(life>0):
		collision_info = move_and_collide(velocity*delta)
		if collision_info:
			if(collision_info.get_collider().is_in_group("wall")):
				if(startBeating == 0):
					startBeating = 1
					$AnimationPlayer.stop()
				velocity = Vector2(0,0)
				if(!$AnimationPlayer.is_playing()):
					$AnimationPlayer.play("atack")
					#self.set_physics_process(false)
			else:
				#warning-ignore:return_value_discarded
				move_and_slide(velocity*delta)


func _on_VisibilityNotifier2D_screen_exited():
	self.remove_from_group("enemies")
	queue_free()


func _endAnimation(anim_name):
	print(anim_name)
	if(anim_name == "atack"):
		game_control.aumentarSugarLevel()