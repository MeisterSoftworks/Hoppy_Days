extends Node2D

func end_game():
	get_tree().change_scene("res://Scenes/GameOver.tscn")
	
func quit_game():
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()