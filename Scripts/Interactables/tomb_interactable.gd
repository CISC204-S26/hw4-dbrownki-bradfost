extends Interactable

@export var opened = false
@export var vertical = false
@export var rightup = false
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

func interact():
	onTombInteracted.emit(opened)
	if not opened:
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
		#print("Tomb Opened")
	else:
		pass
