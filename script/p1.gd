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
	$"dtime".start()


func _on_frame_window_timeout():
	comm_reset()

func spawn_normal_attack():
	var cur_pos = $".".position
	var attack = normal_attack.instance()
	attack.name = "nor_atk"
	attack.position = cur_pos
	attack.direction = 1
	$"..".add_child(attack)

func _ready():
	print("p1.gd")


func _physics_process(_delta):
	if state == WALK:
		if Input.is_action_just_pressed("p1_attack"):
			spawn_normal_attack()
			$"atk_timer".start()
		elif Input.is_action_just_released("p1_attack"):
			$"atk_timer".stop()
		if Input.is_action_pressed("p1_up") and Input.is_action_pressed("p1_down"):
			comm_reset()
			motion = Vector2.ZERO
		elif Input.is_action_just_pressed("p1_up"):
			# when player press up the ready_up change to true
			# and then the timer start.
			# if playe press up again before timer runs out,
			# player wil dash
			if not ready_up:
				$"ftime".start()
				ready_up = true
				ready_down = false
			elif ready_up and neutral:
				$"ftime".stop()
				dash()
		elif Input.is_action_just_pressed("p1_down"):
			if not ready_down:
				$"ftime".start()
				ready_down = true
				ready_up = false
			elif ready_down and neutral:
				$"ftime".stop()
				dash()
		elif Input.is_action_pressed("p1_up"):
			# move_local_y(-WALK_SPEED)
			motion = Vector2(0,-WALK_SPEED)
		elif Input.is_action_pressed("p1_down"):
			# move_local_y(WALK_SPEED)
			motion = Vector2(0,WALK_SPEED)
		elif Input.is_action_just_released("p1_down"):
			neutral = true
			motion = Vector2.ZERO
		elif Input.is_action_just_released("p1_up"):
			neutral = true
			motion = Vector2.ZERO
	elif state == DASH:
		if ready_up:
			# move_local_y(-50)
			motion = Vector2(0,-WALK_SPEED * 3)
		elif ready_down:
			# move_local_y(50)
			motion = Vector2(0,WALK_SPEED * 3)
	move_and_collide(motion * _delta)


func _on_dtime_timeout():
	comm_reset()
	state = WALK
	motion = Vector2.ZERO


func _on_atk_timer_timeout():
	spawn_normal_attack()
