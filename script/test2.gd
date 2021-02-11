extends Node2D

const normal_attack = preload("res://prefabs/normal_attack.tscn")
var helper = false

func _ready():
	pass


func _input(event):
	if event is InputEventKey:
		if event.pressed and event.get_scancode() == KEY_A:
#			print(event.scancode)
#			event.scancode = KEY_U
#			InputMap.action_add_event("beat",event)
			var new_key = event
			new_key.scancode = KEY_P
			InputMap.add_action("double_jump")
			InputMap.action_add_event("double_jump",new_key)
	if Input.is_action_just_pressed("beat"):
		print("beat")
	elif Input.is_action_just_pressed("double_jump"):
		print("double_jump")
func _physics_process(_delta):
	# if Input.is_action_pressed("p1_up") and Input.is_action_pressed("p1_down"):
	# 	print("up_down pressed")
#	if Input.is_action_just_pressed("p1_attack"):
#		print("attack")
	pass
	
