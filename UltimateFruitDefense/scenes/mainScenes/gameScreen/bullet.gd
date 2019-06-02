extends Area2D

#warning-ignore:unused_class_variable
export (float) var SPEED
var direction
#warning-ignore:unused_class_variable
var motion
var eu = weakref(self)
#warning-ignore:unused_class_variable
var collision_info
#warning-ignore:unused_class_variable
var velocity

func _ready():
	self.set_physics_process(true)

func _physics_process(delta):
	move_bullet(delta)

#warning-ignore:unused_argument
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
