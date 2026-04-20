extends Node2D

var switchCombination = [false, true, true, true, false, true]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.room3 = self
