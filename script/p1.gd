extends Node2D

# config
const WALK_SPEED = 20

# const
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
var input_history = []


# move node and log command history
# I think I found a better way perhaps...
func move_and_history(speed:int,command:int):
	move_local_y(speed)
	if input_history.size() == 12: # no more than 8 command
		input_history.remove(0)
	input_history.append(command)
	print(input_history)


# reset the dash system variables to false
func comm_reset():
	ready_up = false
	ready_down = false
	neutral = false


func dash():
	state = DASH
	$"dtime".start()


func _on_frame_window_timeout():
	print("timeout")
	comm_reset()



func _ready():
	print("p1.gd")


func _physics_process(_delta):

	if state == WALK:
		if Input.is_action_pressed("p1_up") and Input.is_action_pressed("p1_down"):
			comm_reset()
		elif Input.is_action_just_pressed("p1_up"):
			if not ready_up:
				$"ftime".start()
				ready_up = true
				ready_down = false
			elif ready_up and neutral:
				print("dash up")
				$"ftime".stop()
				dash()
		elif Input.is_action_just_pressed("p1_down"):
			if not ready_down:
				$"ftime".start()
				ready_down = true
				ready_up = false
			elif ready_down and neutral:
				print("dash down")
				$"ftime".stop()
				dash()
		elif Input.is_action_pressed("p1_up"):
			move_local_y(-WALK_SPEED)
		elif Input.is_action_pressed("p1_down"):
			move_local_y(WALK_SPEED)
		elif Input.is_action_just_released("p1_down"):
			neutral = true
		elif Input.is_action_just_released("p1_up"):
			neutral = true
	elif state == DASH:
		if ready_up:
			move_local_y(-50)
		elif ready_down:
			move_local_y(50)


func _on_dtime_timeout():
	comm_reset()
	state = WALK
