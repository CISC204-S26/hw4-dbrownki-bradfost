extends Interactable

@export var toggled = false
signal onSwitchInteracted(toggled: bool)

func interact():
	if toggled == false:
		toggled = true
		print("Switched ON")
	else:
		toggled = false
		print("Switched OFF")
	onSwitchInteracted.emit(toggled)
