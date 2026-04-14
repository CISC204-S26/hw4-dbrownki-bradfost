extends Node2D

func _on_switch_interacted(toggled: bool) -> void:
	self.queue_free()
