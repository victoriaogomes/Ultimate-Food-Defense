extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	used()
	print("instaced")
	$Timer.start()
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
