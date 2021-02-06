extends KinematicBody2D

# config
const WALK_SPEED = 1000

# const
var motion = Vector2.ZERO
var is_attacking = false
const normal_attack = preload("res://prefabs/normal_attack.tscn")

# dash
const NEUTRAL = 0
const UP = 1
const DOWN = 2
const ATTACK = 3

# states
var state = 0 # set intial state to walk
const WALK = 0
const DASH = 1


# input history
var fwin = 12
var cwin = 0
var ready_up = false
var ready_down = false
var neutral = false


# reset the dash system variables to false
func comm_reset():
	ready_up = false
	ready_down = false
	neutral = false


func dash():
	state = DASH
	$"dtime2".start()


func spawn_normal_attack():
	var cur_pos = $".".position
	var attack = normal_attack.instance()
	attack.name = "nor_atk"
	if get_parent().name == "P2":
		attack.direction = -1
		attack.position = cur_pos + Vector2(-100,0) # spawn infront
	else:
		attack.direction = 1
		attack.position = cur_pos + Vector2(100,0) # spawn infront
	$"..".add_child(attack)

func _ready():
	print("p2.gd")


func _physics_process(_delta):
	if state == WALK:
		if Input.is_action_just_pressed("p2_attack"):
			spawn_normal_attack()
			$"atk_timer2".start()
		elif Input.is_action_just_released("p2_attack"):
			$"atk_timer2".stop()
		if Input.is_action_pressed("p2_up") and Input.is_action_pressed("p2_down"):
			comm_reset()
			motion = Vector2.ZERO
		elif Input.is_action_just_pressed("p2_up"):
			# when player press up the ready_up change to true
			# and then the timer start.
			# if playe press up again before timer runs out,
			# player wil dash
			if not ready_up:
				$"ftime2".start()
				ready_up = true
				ready_down = false
			elif ready_up and neutral:
				$"ftime2".stop()
				dash()
		elif Input.is_action_just_pressed("p2_down"):
			if not ready_down:
				$"ftime2".start()
				ready_down = true
				ready_up = false
			elif ready_down and neutral:
				$"ftime2".stop()
				dash()
		elif Input.is_action_pressed("p2_up"):
			# move_local_y(-WALK_SPEED)
			motion = Vector2(0,-WALK_SPEED)
		elif Input.is_action_pressed("p2_down"):
			# move_local_y(WALK_SPEED)
			motion = Vector2(0,WALK_SPEED)
		elif Input.is_action_just_released("p2_down"):
			neutral = true
			motion = Vector2.ZERO
		elif Input.is_action_just_released("p2_up"):
			neutral = true
			motion = Vector2.ZERO
	elif state == DASH:
		if ready_up:
			# move_local_y(-50)
			motion = Vector2(0,-WALK_SPEED * 3)
		elif ready_down:
			# move_local_y(50)
			motion = Vector2(0,WALK_SPEED * 3)

	# I have no idea how to get rid of this warning
	move_and_collide(motion * _delta) 


func _on_ftime2_timeout():
	comm_reset()


func _on_dtime2_timeout():
	comm_reset()
	state = WALK
	motion = Vector2.ZERO


func _on_atk_timer2_timeout():
	spawn_normal_attack()
