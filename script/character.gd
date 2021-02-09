extends Node2D


onready	var hp_bar = $"../../hp_bar"

func _ready():
	if get_parent().name == "p2":
		$"sprite".set_flip_h(true)

func _on_body_area_entered(area):
	if area.is_in_group("normal_attack"):
		hp_bar.value -= 1
	elif area.is_in_group("sniper_attack"):
		hp_bar.value -= 3
	elif area.is_in_group("blaster_attack"):
		hp_bar.value -= 6

func set_invincible(boolean: bool):
	if boolean:
		$"body".set_monitoring(false)
	else:
		$"body".set_monitoring(true)

