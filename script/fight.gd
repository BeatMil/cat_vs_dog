extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print("maika")
   


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# always times delta
	$dog.move_local_x(-10 * delta)
	$cat.move_local_x(10 * delta)
	pass
