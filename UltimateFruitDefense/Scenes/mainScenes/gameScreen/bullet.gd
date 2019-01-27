extends RigidBody2D

export (int) var SPEED
onready var node = get_node("gameControl")

func _ready():
	self.set_physics_process(true)
	pass

func _physics_process(delta):
	move_bullet(delta)

func move_bullet(delta):
	if node.target != null:
		var target_posistion = node.target.position
		look_at(target_posistion)
		var direction = (target_posistion - self.position).normalized()
		var motion = direction * delta * SPEED
		position += motion
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
