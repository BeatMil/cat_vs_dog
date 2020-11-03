# ball.gd
extends RigidBody2D


# x axis power should be around 0 - 1000
# x will be set by the power_bar
var POWER = Vector2(0,-800)

func _ready():
	set_bounce(1) # You know this one right?
	set_gravity_scale(6) # needed otherwise ball will float so high
	add_torque(5000) # spin the ball~

# func _integrate_forces(state):
	# pass

func apply_force2(fire_power):
	POWER.x = fire_power 		 # set fire power
	apply_central_impulse(POWER) # lunch the ball!


func _on_VisibilityNotifier2D_screen_exited():
	$".".queue_free()
