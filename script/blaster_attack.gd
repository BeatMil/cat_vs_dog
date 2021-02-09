extends Node2D


func _ready():
	pass # Replace with function body.


func _on_active_timer_timeout():
	queue_free()
