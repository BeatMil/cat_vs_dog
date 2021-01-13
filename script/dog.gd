extends Node2D
# this script is neglected
# dont come back here
# lol

func _ready():
	# start with idle animation
	$AnimationPlayer.play("idle")


func _physics_process(delta):
	if Input.is_action_pressed("p1_attack"):
		print("p1_attack")
	pass


func _on_head_body_entered(body):
	# I'm trying to remember things alright??
	# I dont know what to comment yet.
	$AnimationPlayer.play("hurt")
	$animation_timer.start()
	print("head")

func _on_body_body_entered(body):
	$AnimationPlayer.play("hurt")
	$animation_timer.start()
	print("body")

# play hurt animation for 0.5 sec then idle
func _on_animation_timer_timeout():
	if $AnimationPlayer.current_animation == "hurt":
		$AnimationPlayer.play("idle")
