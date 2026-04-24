extends Sprite2D

func _process(delta: float) -> void:
	if Global.orbsCollected <= 5:
		queue_free()
