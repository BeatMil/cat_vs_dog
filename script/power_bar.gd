extends Control


onready var progress = $TextureProgress
signal fire

func _ready():
	progress.value = 0 # set power to 0 at start


func _on_Timer_timeout():
	# Timer is set to 0.02
	# Should I set wait time here instead?
	if progress.value == progress.max_value:
		progress.value = 0
	else:
		progress.value += 25
#	progress.value += 1 if progress.value < progress.max_value else 0
# the shorten if else is better used for assigning value

func _on_Button_button_down():
	$Timer.start()


func _on_Button_button_up():
	var fire_power = progress.value
	emit_signal("fire", fire_power)
	$Timer.stop()
	print(fire_power)
	progress.value = 0
