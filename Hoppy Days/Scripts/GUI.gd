extends CanvasLayer

func _ready():
	Global.GUI = self

func update_GUI(coins, lives):
	$Banner/HBoxContainer/Coin/CoinCount.text = "%02d" % coins
	$Banner/HBoxContainer/Life/LifeCount.text = "%02d" % lives

func animate(animation):
	$AnimationPlayer.play(animation)