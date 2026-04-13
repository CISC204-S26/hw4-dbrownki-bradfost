extends Interactable

@export var toggled = false
signal onSwitchInteracted

func interact():
	if toggled == false:
		toggled = true
		print("Switched ON")
	else:
		toggled = false
		print("Switched OFF")
