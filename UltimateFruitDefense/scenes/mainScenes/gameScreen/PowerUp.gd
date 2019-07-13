extends KinematicBody2D

# Declare member variables here. Examples:
var motion = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(true)


func _process(delta):
	motion.y = -80
	move_and_slide(motion)
	

func prepar(inicial, text):
	self.position = inicial
	$Label.text = text
	$Timer.start()

func _on_Timer_timeout():
	queue_free()
