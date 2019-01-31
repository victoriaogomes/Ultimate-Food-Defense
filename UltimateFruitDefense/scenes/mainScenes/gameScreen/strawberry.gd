extends KinematicBody2D

func _ready():
	used()
	print("instaced")
	$
	self.set_physics_process(true)


func used():
	var pos = Vector2(2.22488, -6.3)
	self.set_position(pos)
	$AnimatedSprite.play("used")
	
func done():
	self.queue_free()
	print("fruta destruída")
func _process(delta):
	$Timer.connect("timeout", self, "done")