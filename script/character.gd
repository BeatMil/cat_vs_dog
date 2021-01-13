extends Node2D


var this_name = $".".get_name() # debug
var hp = 100 # character health


func _ready():
	pass


func _on_head_body_entered(body):
	if body.is_in_group("normal_attack"):
		decrease_hp(50)
		print("%s hits %s head hp: %s"%[body,this_name,hp])
		$AnimationPlayer.play("hurt")


func _on_body_body_entered(body):
	if body.is_in_group("normal_attack"):
		decrease_hp(20)
		print("%s hits %s body hp: %s"%[body,this_name,hp])
		$AnimationPlayer.play("hurt")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "hurt":
		$AnimationPlayer.play("idle")


func decrease_hp(amount : int):
	hp -= amount
