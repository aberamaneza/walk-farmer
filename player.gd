extends KinematicBody2D

var speed = 100
var mot = Vector2.UP
var gravity = 10
var dead = false
var jump = 300
func _ready():
	Global.checkx = position.x
	Global.checky = position.y
func _physics_process(delta):
	var der = 0
	if Global.heart <= 0:
		position.x = Global.checkx
		position.y = Global.checky
		Global.heart += 3

	if Input.is_action_pressed("ui_left"):
		$AnimationPlayer.play("runleft")
		der -= 1
		$Position2D.position.x = -55
		Global.posb = -1
	if dead:
		$AnimationPlayer.play("dead")
	if Input.is_action_just_released("ui_accept"):
		$AnimationPlayer.play("atack")
		
		var player_position = $Position2D.position
		
		var scene_instance = load("res://bullet.tscn").instance()
		scene_instance.position = player_position
		
		add_child(scene_instance)
		

		

	if Input.is_action_pressed("ui_right"):
		Global.posb = 1
		$Position2D.position.x = 1
		$AnimationPlayer.play("run")
		der += 1
	
	if Input.is_action_pressed("ui_up") and is_on_floor():
		$AnimationPlayer.play("jump")
		mot.y -= jump
		$jump.play()
	if !is_on_floor():
		mot.y += gravity
		
		
	mot.x = der * speed
	mot = move_and_slide(mot,Vector2.UP)







func _on_jump_finished():
	$jump.stream_paused





func _on_Area2D_body_entered(body):
	if is_on_floor():
		$walk.play()
	else:
		$walk.stream_paused


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "dead":
		$AnimationPlayer.stop()
		dead = false

