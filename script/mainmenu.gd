extends Control


func _on_Button_pressed():
	print(get_tree().change_scene("res://scene/fight.tscn"))


func _on_exit_button_down():
	get_tree().quit()
