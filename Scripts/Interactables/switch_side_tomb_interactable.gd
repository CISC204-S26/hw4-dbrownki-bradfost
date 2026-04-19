extends Interactable

@export var opened = false
@export var doorToOpen: Node2D
@export var hiddenElement: Interactable

signal onTombInteracted(toggled: bool)

func _ready():
	if hiddenElement:
		hiddenElement.hide()
		hiddenElement.process_mode = Node.PROCESS_MODE_DISABLED

func interact():
	if opened == false:
		opened = true
		$LeftTombClosed.visible = false
		$LeftTombOpened.visible = true
		$InteractableCollider.queue_free()
		if hiddenElement:
			hiddenElement.process_mode = Node.PROCESS_MODE_INHERIT
			hiddenElement.show()
		print("Tomb Opened")
	else:
		pass
	onTombInteracted.emit(opened)

func _on_tomb_switch_interacted(toggled: bool) -> void:
	if toggled:
		if doorToOpen:
			if doorToOpen == $"../DungeonDoors/SideDoor2":
				Global.leftDoorOpen = true
#			if doorToOpen == $"../DungeonDoors/SideDoor":
#				Global.rightDoorOpen = true
			doorToOpen.queue_free()
