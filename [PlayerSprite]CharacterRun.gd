extends KinematicBody2D
var direction = Vector2(Global.posb, 0)
var speed = 200
var arrow_interval = 1.0  # وقت الانتظار بين كل سهم (1 ثانية في هذه الحالة)
func _process(delta):
	var movement = direction.normalized() * speed * delta
	var collision = move_and_collide(movement)
	if collision:
		queue_free()
		# هنا يمكنك إضافة التأثيرات عندما يصطدم الرصاص بشيء

	# تحديث موقع الرصاصة
	position += movement

	


func _on_fvxff_body_entered(body):
	if body.is_in_group("enemy"):
		body.vale -= 30
		queue_free()
