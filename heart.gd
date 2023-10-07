extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("idle")





func _on_Area2D_body_entered(body):
		if body.is_in_group("player"):
			Global.heart += 1
			$heart.play()
			$AnimationPlayer.stop()
			$AnimationPlayer.queue_free()
			$Heart.queue_free()
			$Heart/Area2D.queue_free()

