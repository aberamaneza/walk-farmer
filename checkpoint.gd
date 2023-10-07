extends KinematicBody2D

func _physics_process(delta):
	$AnimationPlayer.play("idle")


func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		Global.checkx = position.x
		Global.checky = position.y
		
