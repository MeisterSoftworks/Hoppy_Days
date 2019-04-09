extends AnimatedSprite

func _on_Area2D_body_entered(body):
	Global.GameState.coin_up()
	$AnimationPlayer.play("die")
	Global.SFX_Coin.play()

func die():
	queue_free()
