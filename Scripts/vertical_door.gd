extends Sprite2D


func _on_switch_interactable_on_switch_interacted(toggled: bool) -> void:
	self.queue_free()
