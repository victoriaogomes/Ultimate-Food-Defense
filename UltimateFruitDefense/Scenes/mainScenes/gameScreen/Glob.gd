extends Node2D

#var bullet =  preload("res://scenes/mainScenes/gameScreen/bullet.tscn")
#onready var target = get_node("/root/burguer/Mob")
#onready var target1 = get_node("/root/pizza/Mob")
#onready var target2 = get_node("/root/soda/Mob")


#func _ready():
#	self.set_physics_process(true)


#func _process(delta):
#	swap_animation(delta)


#func swap_animation(delta):
#	if target != null || target1 != null || target2 != null:
#		print("tem inimigo")
#		var anim
#		var pos
#		var target_position = target.position
#		if target_position.y < -111:
#			if target_position.x <-91:
#				anim = "shootUp2"
#				pos = $PositionUp2
#			else:
#				anim = "shootUp1"
#				pos = $PositionUp1
#		elif target_position.y < -48 && target_position > -91:
#			anim = "shootCenter"
#			pos = $PositionCenter
#		elif target_position.y < 1.8 && target_position > -48:
#			if target_position.x < -94:
#				anim = "shootDown1"
#				pos = $PositionDown1
#			else:
#				anim = "shootCenter"
#				pos = $PositionCenter
#		elif target_position.y < 60 && target_position.y > 1.8:
#			if target_position.x < -170:
#				anim = "shootDown2"
#				pos = $PositionDown2
#			else:
#				anim = "shootDown1"
#				pos = $PositionDown1
#		elif target_position.y > 60:
#			if target_position.x < -58:
#				anim = "shootDown2"
#				pos = $PositionDown2
#			else:
#				anim = "shootDown1"
#				pos = $PositionDown1
#		$AnimatedSprite.play(anim)
#		spwan_bullet(pos)
#	else:
#		print("n tem inimigo!")
#		$AnimatedSprite.play("idle")
#
#func spwan_bullet(pos):
#	var clone_bullet = bullet.instance()
#	get_parent().add_child(clone_bullet)
#	clone_bullet.position = pos.global_position