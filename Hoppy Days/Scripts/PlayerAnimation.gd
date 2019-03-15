extends AnimatedSprite

func update(motion):
	if motion.y < 0:
		play("jump")
	elif motion.x > 0:
		play("run")
	elif motion.x < 0:
		play("run")
	else:
		play("idle")
	
	if motion.x: #If there is an X value in Vector2, call "motion"
		flip_h = (motion.x < 0) #Set flip_h's true/false value to be same as motion.x < 0