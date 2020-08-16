# ball.gd
extends RigidBody2D


# x axis power should be around 0 - 1000
var POWER = Vector2(100,-800)

func _ready():
	set_bounce(1)
	set_gravity_scale(6)
	add_torque(5000)


func _physics_process(delta):
	pass

func _integrate_forces(state):
	pass
	
func apply_force2(fire_power):
	POWER.x = fire_power
	apply_central_impulse(POWER)



func _on_VisibilityNotifier2D_screen_exited():
	$".".queue_free()
