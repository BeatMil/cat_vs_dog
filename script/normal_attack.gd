extends Node2D


func _ready():
	pass # Replace with function body.

func _physics_process(_delta):
	# move_local_y(Vector2.LEFT * delta)
	move_local_x(-1000 * _delta)
