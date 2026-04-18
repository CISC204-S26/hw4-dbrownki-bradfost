extends Area2D

@export var entering_scene: PackedScene

func _on_body_entered(body: CharacterBody2D):
	Global.goto_scene(entering_scene)
	#get_tree().change_scene_to_packed(entering_scene)


func _on_body_exited(body: CharacterBody2D):
	pass # Replace with function body.
