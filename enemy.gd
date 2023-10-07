extends KinematicBody2D

var der = -1
var speed = 40
var mot = Vector2.ZERO
var vale = 100
func _physics_process(delta):
	$ProgressBar.value = vale
	$AnimationPlayer.play("atack")
	if vale <= 0:
		queue_free()
	if !is_on_floor():
		
		mot.y += 10
	if !$RayCast2D.is_colliding():
		der *= -1
		scale.x = -1
	if is_on_wall():
		scale.x = -1
		der *= -1
	mot.x = speed * der
	move_and_slide(mot,Vector2.UP)




func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		Global.heart -= 1
