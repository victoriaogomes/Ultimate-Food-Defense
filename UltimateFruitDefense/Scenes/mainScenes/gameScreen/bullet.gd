extends Area2D

export (float) var SPEED
var direction
var motion
var eu = weakref(self)
var collision_info
var velocity

func _ready():
	self.set_physics_process(true)

func _physics_process(delta):
	move_bullet(delta)

func move_bullet(delta):
	if (game_control.target != null):
		if(eu.get_ref()):
			look_at(game_control.target.position)
			direction = (game_control.target.position - self.position).normalized()
			#motion = delta * SPEED * direction
			position += direction
			#if(is_on_wall()):
			#queue_free()
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_bullet_body_entered(body):
	if(body.is_in_group("enemies")):
		queue_free()
