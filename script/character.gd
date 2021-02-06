extends Node2D


onready	var hp_bar = $"../../hp_bar"

func _ready():
	if get_parent().name == "p2":
		$"sprite".set_flip_h(true)

func _on_body_area_entered(area):
	if area.is_in_group("normal_attack"):
		hp_bar.value -= 1
