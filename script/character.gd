extends Node2D

func _ready():
	pass


func _on_body_area_entered(area):
	if area.is_in_group("normal_attack"):
		print("normal_attack")
	pass # Replace with function body.
