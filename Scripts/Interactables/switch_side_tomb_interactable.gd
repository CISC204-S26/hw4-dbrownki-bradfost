extends Interactable

@export var opened = false
@export var vertical = false
@export var rightup = false
@export var doorToOpen: Node2D
@export var hiddenElement: Interactable

signal onTombInteracted(toggled: bool)

func _ready():
	match vertical:
		false:
			match rightup:
				false:
					$TombSprite.frame = 0
				true:
					$TombSprite.frame = 4
		true:
			match rightup:
				false:
					$TombSprite.frame = 6
				true:
					$TombSprite.frame = 2
	if hiddenElement:
		hiddenElement.hide()
		hiddenElement.process_mode = Node.PROCESS_MODE_DISABLED
	if opened:
		opened = false
		interact()

func interact():
	if opened == false:
		opened = true
		$InteractableCollider.queue_free()
		match vertical:
			false:
				match rightup:
					false:
						$TombSprite.frame = 1
					true:
						$TombSprite.frame = 5
			true:
				match rightup:
					false:
						$TombSprite.frame = 7
					true:
						$TombSprite.frame = 3
		if hiddenElement:
			hiddenElement.process_mode = Node.PROCESS_MODE_INHERIT
			hiddenElement.show()
		#print("Tomb Opened")
	else:
		pass
	onTombInteracted.emit(opened)

func _on_tomb_switch_interacted(toggled: bool) -> void:
	if toggled:
		if doorToOpen:
			if doorToOpen == $"../DungeonDoors/SideDoor2":
				Global.leftDoorOpen = true
			if doorToOpen == $"../DungeonDoors/SideDoor":
				Global.rightDoorOpen = true
			doorToOpen.queue_free()
