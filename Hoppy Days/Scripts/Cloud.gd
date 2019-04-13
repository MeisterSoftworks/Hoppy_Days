extends Node2D

var timed_out = false

func _process(delta):
	if $Sprite/RayCast2D.is_colliding():
		Attack()

func Attack():
	if not timed_out:
		$Sprite/RayCast2D.add_child(load(Global.Lightning).instance())
		$Sprite/Timer.start()
		timed_out = true

func _on_Timer_timeout():
	timed_out = false
