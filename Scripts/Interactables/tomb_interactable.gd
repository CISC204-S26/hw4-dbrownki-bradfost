extends Interactable

@export var opened = false
signal onTombInteracted(toggled: bool)

func interact():
	onTombInteracted.emit(opened)
	if opened == false:
		opened = true
		$LeftTombClosed.visible = false
		$LeftTombOpened.visible = true
		$InteractableCollider.queue_free()
		print("Tomb Opened")
	else:
		pass
