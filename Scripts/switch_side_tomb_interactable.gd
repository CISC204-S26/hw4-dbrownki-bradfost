extends Interactable

@export var opened = false
var switch_scene: PackedScene = preload("res://Scenes/Interactables/switch_interactable.tscn")
signal onTombInteracted(toggled: bool)

func interact():
	onTombInteracted.emit(opened)
	if opened == false:
		opened = true
		$LeftTombClosed.visible = false
		$LeftTombOpened.visible = true
		print("Tomb Opened")
		var switch = switch_scene.instantiate() as Interactable
		add_child(switch)
	else:
		pass
