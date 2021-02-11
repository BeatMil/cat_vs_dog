extends Node2D


var helper_A = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if helper_A:
		if event.is_pressed() is InputEventKey:
			$"Label".text = event.as_text()
		helper_A = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Button_button_down():
	print("beat")
	helper_A = true
