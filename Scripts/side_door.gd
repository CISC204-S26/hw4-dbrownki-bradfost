extends Node2D

@export var tag: String

func _ready() -> void:
	match tag:
		"Left Door":
			if Global.leftDoorOpen:
				queue_free()
		"Right Door":
			if Global.rightDoorOpen:
				queue_free()

func _on_switch_interacted(toggled: bool) -> void:
	self.queue_free()
