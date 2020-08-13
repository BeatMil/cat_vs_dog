extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$TextureProgress.value = 0


func _on_Timer_timeout():
	if $TextureProgress.value == $TextureProgress.max_value:
		$TextureProgress.value = 0
	else:
		$TextureProgress.value += 1


func _on_Button_button_down():
	$Timer.start()


func _on_Button_button_up():
	$Timer.stop()
