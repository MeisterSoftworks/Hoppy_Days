extends CanvasLayer

func _ready():
	Global.GUI = self

func update_GUI(lives):
	$Banner/HBoxContainer/Life/LifeCount.text = "%02d" % lives
	
