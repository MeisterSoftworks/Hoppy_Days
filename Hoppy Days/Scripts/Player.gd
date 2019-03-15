extends KinematicBody2D

const MOVE_SPD = 750
const GRAVITY = 3000
const UP = Vector2(0,-1)
const JUMP_SPD = 1400

var motion = Vector2()

func _process(delta):
	update_animation(motion)

func _physics_process(delta):
	update_motion(delta)

func update_motion(delta):
	grav_ctrl(delta)
	move_ground()
	motion = move_and_slide(motion, UP) #Stops "motion.y" buildup

func update_animation(motion):
	$AnimatedSprite.update(motion)

func grav_ctrl(delta):
	#GRAVITY
	if is_on_floor() && $RayCast2D.is_colliding(): #Accelerate player downward until landed on floor
		motion.y = 0
	else:
		motion.y += GRAVITY * delta

func move_ground():
	var move_right = Input.is_action_pressed("ui_right")
	var move_left = Input.is_action_pressed("ui_left")
	var jump = Input.is_action_just_pressed("ui_up")
	
	if move_right && !move_left:
		motion.x = MOVE_SPD
	elif move_left && !move_right:
		motion.x = -MOVE_SPD
	else:
		motion.x = 0
	
		#JUMP
	if jump && is_on_floor():
		motion.y = -JUMP_SPD

