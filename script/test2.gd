extends Node2D

const normal_attack = preload("res://prefabs/normal_attack.tscn")

func _ready():
	var attack = normal_attack.instance()
	attack.name = "nor_atk"
	attack.position = Vector2(960,560)
	attack.direction = -1
	self.add_child(attack)

func _physics_process(_delta):
	if Input.is_action_pressed("p1_up") and Input.is_action_pressed("p1_down"):
		print("up_down pressed")
