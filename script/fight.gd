# fight.cd
extends Node2D


var BALL = preload("res://prefabs/ball.tscn")

func _ready():
	$power_bar/Button.grab_focus()
	print("beat is the best!")


func _process(delta):
	# always times delta
	$dog.move_local_x(-10 * delta) # move dog
	$cat.move_local_x(10 * delta) # move cat


func _on_power_bar_fire(fire_power):
	var ball = BALL.instance()
	ball.position = Vector2(480,750)
	add_child(ball)
	ball.apply_force2(fire_power)
