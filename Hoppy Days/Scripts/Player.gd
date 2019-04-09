extends KinematicBody2D

const move_spd = 750
const Gravity = 2800
const UP = Vector2(0,-1)
const jump_spd = 1500

export var world_limit = 3000 #Exports variable to inspector
var motion = Vector2()

func _ready():
	Global.Player = self

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
	#Gravity
	if is_on_floor() || is_on_ceiling(): #Accelerate player downward until landed on floor
		motion.y = 10
	else:
		motion.y += Gravity * delta
		
	if position.y > world_limit:
		Global.GameState.end_game()

func move_ground():
	var move_right = Input.is_action_pressed("ui_right")
	var move_left = Input.is_action_pressed("ui_left")
	var move_jump = Input.is_action_just_pressed("ui_up")
	
	if move_right && !move_left:
		motion.x = move_spd
	elif move_left && !move_right:
		motion.x = -move_spd
	else:
		motion.x = 0
	
	if move_jump && is_on_floor():
		Jump()
		Global.SFX_Jump.play()

func Jump():
	motion.y = -jump_spd