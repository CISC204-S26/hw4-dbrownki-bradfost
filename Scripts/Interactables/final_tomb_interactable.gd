extends Interactable

@export var opened = false
@export var vertical = false
@export var rightup = false
@export var text = []
var index = 0
signal enteredTalking
signal exitedTalking
signal showText(text: String)
signal onTombInteracted(toggled: bool)

func _ready():
	if opened:
		$InteractableCollider.queue_free()
	match vertical:
		false:
			match rightup:
				false:
					if opened:
						$TombSprite.frame = 1
					else:
						$TombSprite.frame = 0
				true:
					if opened:
						$TombSprite.frame = 5
					else:
						$TombSprite.frame = 4
		true:
			match rightup:
				false:
					if opened:
						$TombSprite.frame = 7
					else:
						$TombSprite.frame = 6
				true:
					if opened:
						$TombSprite.frame = 3
					else:
						$TombSprite.frame = 2

func interact():
	print(index)
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
		$"Tomb Light".hide()
		enteredTalking.emit()
		$"../CanvasLayer/TextContainer".hide()
		await get_tree().create_timer(2.0).timeout
		$"../CanvasLayer/TextContainer".show()
		showText.emit(text[index])
		await get_tree().create_timer(5.0).timeout
		$"../CanvasLayer/TextContainer".hide()
		$"../Darkness".color = Color(0.0, 0.0, 0.0, 1.0)
		#exitedTalking.emit() if we want to allow the player to
		# move around after the cutscene plays
