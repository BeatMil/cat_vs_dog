# ball.gd
extends RigidBody2D


# x axis power should be around 0 - 1000
var POWER = Vector2(100,-500)
var start_position = $".".global_position

# Called when the node enters the scene tree for the first time.
func _ready():
	
#	set_gravity_scale(6)
#	add_torque(5000)
#	apply_central_impulse(POWER)
	pass # Replace with function body.


func _physics_process(delta):
	pass

func _integrate_forces(state):
	pass
	
func apply_force2(fire_power):
	POWER.x = fire_power
	$".".transform = Transform2D(0,Vector2(100,100))
	$".".linear_velocity = Vector2.ZERO
#	$".".position = Vector2(100,100)
	apply_central_impulse(POWER)

func _on_power_bar_fire(fire_power):
	apply_force2(fire_power)
	pass
