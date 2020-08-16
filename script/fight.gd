# fight.cd
extends Node2D


var BALL = preload("res://prefabs/ball.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	$power_bar/Button.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# always times delta
	$dog.move_local_x(-10 * delta)
	$cat.move_local_x(10 * delta)


func _on_power_bar_fire(fire_power):
	var ball = BALL.instance()
	ball.position = Vector2(480,750)
	add_child(ball)
	ball.apply_force2(fire_power)
