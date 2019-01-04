extends StaticBody2D

onready var body = get_node("tomatoBox")
var base_sprite = preload("res://sprites/Tomato box.png")
var hover_sprite = preload("res://sprites/Wheel.png")

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_tomatoStaticBody2D_mouse_entered():
	print("enter")
	body.set_texture(hover_sprite)


func _on_tomatoStaticBody2D_mouse_exited():
	print("exit")
	body.set_texture(base_sprite)
