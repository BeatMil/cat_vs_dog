extends KinematicBody2D

var motion = Vector2.ZERO

func _physics_process(delta):
	if Input.is_action_pressed("p1_down"):
		motion = Vector2(0,10)
	elif Input.is_action_just_released("p1_down"):
		motion = Vector2.ZERO
	move_and_collide(motion)
