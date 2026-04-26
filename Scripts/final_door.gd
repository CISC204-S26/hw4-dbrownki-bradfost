extends Sprite2D

func _process(delta: float) -> void:
	if Global.orbsCollected <= 10:
		queue_free()
