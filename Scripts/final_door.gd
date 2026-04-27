extends Sprite2D

func _ready():
	if Global.orbsCollected >= 10 and Global.switchPuzzleSolved:
		queue_free()
