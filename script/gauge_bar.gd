extends ProgressBar


func _ready():
	# set min and max value to match the parent
	min_value = get_parent().min_value
	max_value = get_parent().max_value


func _physics_process(delta):
	pass


func start_gauge():
	$"gauge_bar_timer".start()


func reset_gauge():
	$"gauge_bar_timer".stop()
	value = 0

func _on_gauge_bar_timer_timeout():
	# stop charging go beyond mp_bar
	if value >= get_parent().value:
		pass
	else:
		value += step


