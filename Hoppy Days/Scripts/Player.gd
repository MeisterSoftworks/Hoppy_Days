extends KinematicBody2D

const SPEED = 750
var motion = Vector2()

func get_input():
	motion = Vector2()
	if Input.is_action_pressed("ui_right"):
		motion.x += 1
	if Input.is_action_pressed("ui_left"):
		motion.x -= 1
	motion = motion * SPEED

func _physics_process(delta):
	get_input()
	move_and_slide(motion)
