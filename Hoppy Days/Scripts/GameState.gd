extends Node2D

func _ready():
	Global.GameState = self
	print(Global.GameState)

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()

func end_game():
	get_tree().change_scene("res://Scenes/GameOver.tscn")
	