extends Node2D


var this_name = $".".get_name() # debug


func _ready():
	pass


func _on_head_body_entered(body):
	if body.is_in_group("normal_attack"):
		print("%s hits %s head"%[body,this_name])
		$AnimationPlayer.play("hurt")



func _on_body_body_entered(body):
	if body.is_in_group("normal_attack"):
		print("%s hits %s body"%[body,this_name])
		$AnimationPlayer.play("hurt")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "hurt":
		$AnimationPlayer.play("idle")
