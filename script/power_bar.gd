extends Control


onready var progress = $TextureProgress

func _ready():
	progress.value = 0 # set power to 0 at start


func _on_Timer_timeout():
	# Timer is set to 0.02
	# Should I set wait time here instead?
	if progress.value == progress.max_value:
		progress.value = 0
	else:
		progress.value += 1
#	progress.value += 1 if progress.value < progress.max_value else 0
# the shorten if else is better used for assigning value

func _on_Button_button_down():
	$Timer.start()


func _on_Button_button_up():
	$Timer.stop()
	progress.value = 0
