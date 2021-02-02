extends Node2D


onready	var hp_bar = $"../../hp_bar"

func _ready():
	print(hp_bar.name)
	hp_bar.set_value(10)
	pass


func _on_body_area_entered(area):
	if area.is_in_group("normal_attack"):
		hp_bar.value -= 1
		print("normal_attack")
	pass # Replace with function body.
