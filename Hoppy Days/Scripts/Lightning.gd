extends Area2D

const SPEED = 200
var pos_X = Vector2()

func _ready():
	pos_X = global_position.x

func _physics_process(delta):
	move_down_screen(delta)
	collision_check()
	
#	if not $VisibilityNotifier2D.is_on_screen():
#		queue_free()

func move_down_screen(delta):
	global_position.y += SPEED * delta
	global_position.x = pos_X

func collision_check():
	var collider = get_overlapping_bodies()
	for object in collider:
		if object == Global.Player:
			Global.GameState.hurt()
		queue_free() #Regardless of IF statement, delete the instance after collision

func _on_screen_exited(): #Using signal to minimize performance drops
	if global_position.y > 5000:
		queue_free()
