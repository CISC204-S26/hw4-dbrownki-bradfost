class_name Interactable extends Area2D

# Inspector Variables
@export var interactionName: String
@export var type: String
@export var displayActive = false

func interact():
	push_warning("This interactable doesn't have Interact() code yet.")


# interactable types
# Opening a door (with key/collectible)
# Collecting a key (pick up object)
# Reading a sign
# Flipping a lever
