extends AnimatedSprite

var collected = false

func _on_Area2D_body_entered(body):
	if not collected:
		collected = true
		Global.GameState.coin_up()
		$AnimationPlayer.play("die")
		$AudioStreamPlayer.play()

func die():
	queue_free()
