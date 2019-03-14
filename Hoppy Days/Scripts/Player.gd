extends KinematicBody2D

const SPEED = 750
const GRAVITY = 2800
const UP = Vector2(0,-1)
const JUMP_SPD = 1400

var motion = Vector2()

func _physics_process(delta):
	get_fall(delta)
	get_move()
	get_jump()
	motion = move_and_slide(motion, UP)

func get_fall(delta):
	#Accelerates player downward until landing on ground
	if is_on_floor() && $RayCast2D.is_colliding():
		motion.y = 0
	else:
		motion.y += GRAVITY * delta

func get_move():
	if Input.is_action_pressed("ui_right") && !Input.is_action_pressed("ui_left"):
		motion.x = SPEED
		$AnimatedSprite.play("run")
		
	elif Input.is_action_pressed("ui_left") && !Input.is_action_pressed("ui_right"):
		motion.x = -SPEED
		$AnimatedSprite.play("run")
	else:
		motion.x = 0
		$AnimatedSprite.play("idle")
		
	if motion.x: #If there is an X value in Vector2, call "motion"
		$AnimatedSprite.flip_h = motion.x < 0 #Set flip_h's true/false value to be same as motion.x < 0

func get_jump():
	if is_on_floor() && Input.is_action_pressed("ui_up"):
		motion.y = -JUMP_SPD
