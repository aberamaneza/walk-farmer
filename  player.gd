extends KinematicBody2D

var speed = 100
var mot = Vector2.UP
var gravity = 10

var jump = 300
func _physics_process(delta):
	var der = 0


	if Input.is_action_pressed("ui_left"):
		$AnimationPlayer.play("runleft")
		der -= 1
		

	if Input.is_action_pressed("ui_right"):
		$AnimationPlayer.play("run")
		
		
		der += 1
	if Input.is_action_pressed("ui_up") and is_on_floor():
		$AnimationPlayer.play("jump")
		mot.y -= jump
		$jump.play()
		
	mot.y += gravity
	mot.x = der * speed
	mot = move_and_slide(mot,Vector2.UP)


func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		get_tree().reload_current_scene()





func _on_jump_finished():
	$jump.stream_paused
