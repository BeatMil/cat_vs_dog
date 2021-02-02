extends Node2D
export(int) var speed = 1000
export(int, -1,1) var direction # 1 right, -1 left


func _ready():
	pass # Replace with function body.

func _physics_process(_delta):
	move_local_x(speed * direction * _delta)
	pass


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	pass # Replace with function body.
