extends KinematicBody2D

const SPEED = 750
var motion = Vector2()

func _physics_process(delta):
	if Input.is_action_pressed("ui_right") && !Input.is_action_pressed("ui_left"):
		motion.x = SPEED
		$AnimatedSprite.play("run")
		
	elif Input.is_action_pressed("ui_left") && !Input.is_action_pressed("ui_right"):
		motion.x = -SPEED
		$AnimatedSprite.play("run")
	else:
		motion.x = 0
		$AnimatedSprite.play("idle")
		
	if motion.x:
		$AnimatedSprite.flip_h = motion.x < 0
	move_and_slide(motion)
