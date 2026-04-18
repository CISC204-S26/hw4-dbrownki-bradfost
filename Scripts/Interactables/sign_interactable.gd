extends Interactable

@export var text = []
var index = 0
signal enteredTalking
signal exitedTalking
signal showText(text: String)


func _ready() -> void:
	$GoldSkull.hide()
	$GoldBone.hide()
	$GoldSansSkull.hide()
	$PixelBone.hide()
	$PixelSkull.hide()
	print(randi_range(0, 10))
	if randi_range(0, 10) == 10:
		$GoldSkull.show()
		$GoldBone.show()
		if randi_range(0, 10) == 10:
			$GoldSansSkull.show()
	else:
		$PixelBone.show()
		$PixelSkull.show()
	
func interact():
	if index == text.size():
		exitedTalking.emit()
		# used to allow the player to move again after interacting 
		index = 0
	elif index == 0:
		enteredTalking.emit()
		# used to stop the player from moving while interacting 
		showText.emit(text[index])
		index += 1
	else:
		showText.emit(text[index])
		index += 1
