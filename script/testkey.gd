extends Node2D


var helper_A = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _process(delta):
	$Label2.text = String(helper_A)
	if Input.is_action_just_pressed("beat"):
		print("beat_yay")


func _input(event):
	if helper_A:
		if event is InputEventKey:
			if event.is_pressed():
				$Label.text = event.as_text()
				InputMap.action_add_event("beat",event)
				helper_A = false


func _on_Button_button_down():
	helper_A = true
