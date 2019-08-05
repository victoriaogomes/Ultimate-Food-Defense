extends Area2D

#warning-ignore:unused_class_variable
export (float) var SPEED
#warning-ignore:unused_class_variable
var direction
#warning-ignore:unused_class_variable
var motion
#warning-ignore:unused_class_variable
var eu = weakref(self)
#warning-ignore:unused_class_variable
var collision_info
#warning-ignore:unused_class_variable
var velocity

func _ready():
	self.set_physics_process(true)

func _physics_process(delta):
	move_bullet(delta)
	if self.position.x >32:
		queue_free()

#warning-ignore:unused_argument
func move_bullet(delta):
	#if (game_control.target != null):
		#if(eu.get_ref()):
			#look_at(game_control.target.position)
			#direction = (game_control.target.position - self.position).normalized()
			#position += direction
	var motion = Vector2(cos(self.rotation), sin(self.rotation)) * 100
	position += motion * delta


func _on_bullet_body_entered(body):
	if(body.is_in_group("enemies")):
		body.shot = true
		game_control._shot()
		queue_free()
