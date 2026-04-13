extends Interactable

signal collectibleCollected

func interact():
	collectibleCollected.emit()
	print("Hey you collected an orb and now have " + str(Global.orbsCollected) + " orbs")
	queue_free()
