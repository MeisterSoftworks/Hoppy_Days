extends KinematicBody2D

const move_spd = 750
const Gravity = 2800
const UP = Vector2(0,-1)
const jump_spd = 1500

export var world_limit = 3000 #Exports variable to inspector
export var starting_lives = 3

var motion = Vector2()
var lives

func _ready():
	Global.Player = self
	lives = starting_lives

func _process(delta):
	update_animation(motion)
	
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()

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
	
		#JUMP
	if move_jump && is_on_floor():
		Jump()

func Jump():
	motion.y = -jump_spd

func hurt():
	lives -= 1
	Jump()
	
	if lives < 0:
		Global.GameState.end_game()
