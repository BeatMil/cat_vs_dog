extends Button

export var scene = ""


func _on_Button_button_down():
	print(get_tree().change_scene(scene))
