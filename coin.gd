extends KinematicBody2D

var sfx_coin_sound

func _ready():
	$AnimationPlayer.play("idle")

#func _process(_delta):
	

func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		Global.coin += 1
		$coin.play()
		$AnimationPlayer.stop()
		$AnimationPlayer.queue_free()
		$MonedaD.queue_free()
		$Area2D.queue_free()
