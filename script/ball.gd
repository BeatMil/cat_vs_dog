extends RigidBody2D


# x axis power should be around 0 - 1000
var POWER = Vector2(1000,-500)


# Called when the node enters the scene tree for the first time.
func _ready():
	set_gravity_scale(6)
	add_torque(5000)
	apply_central_impulse(POWER)
	pass # Replace with function body.


func _physics_process(delta):
	pass
