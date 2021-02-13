extends Node2D

onready var key_helper = false # help pop out the grey ColorRect screen
onready var action = $".".get_name()
onready var button_text = InputMap.get_action_list(action)[0].as_text()
onready var label = $"Button".get_child(0)

func _ready():
	label.text = button_text

func _input(event):
	if key_helper:
		if event is InputEventKey:
			if event.is_pressed():
				# reset everything and show the new key map 
				InputMap.action_erase_events(action)
				InputMap.action_add_event(action, event)
				$"../ColorRect".set_visible(false)
				key_helper = false
				label.text = InputMap.get_action_list(action)[0].as_text()


func _on_Button_button_down():
	key_helper = true
	$Button.get_child(0).text = ""
	$"../ColorRect".set_visible(true)
	$Button.release_focus()
