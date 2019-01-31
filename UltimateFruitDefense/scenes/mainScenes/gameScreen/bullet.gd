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
			position += direction


func _on_bullet_body_entered(body):
	if(body.is_in_group("enemies")):
		body.shot = true
		queue_free()
