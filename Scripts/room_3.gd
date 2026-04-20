extends Node2D

var switchCombination = [false, true, true, true, false, true]
# The correct combination of switch states.
@export var puzzleSwitches: Node
# Stores a reference to the parent node of the switches, so we
# can easily get references to all the switches.
@export var puzzleDoor: Sprite2D
# Stores a reference to the door that will be removed once the
# switch puzzle is solved.
var switches = []
# Stores a reference to each individual switch node.
# useful for changing their toggle values.
var inputCombination = []
# Stores the current toggle values of each of the switches.
# an array of trues and falses.


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.room3 = self
	if puzzleSwitches:
		switches = puzzleSwitches.get_children()
		if Global.switchPuzzleSolved:
			for i in range(switches.size()):
				if switchCombination[i] == true:
					switches[i].interact()
				inputCombination.append(switches[i].toggled)
		else:
			for i in range(switches.size()):
				inputCombination.append(switches[i].toggled)
	print(inputCombination)


func _on_switch_interacted(toggled: bool) -> void:
	inputCombination = []
	for i in range(switches.size()):
		inputCombination.append(switches[i].toggled)
	if Global.switchPuzzleSolved == false:
		if inputCombination == switchCombination:
			Global.switchPuzzleSolved = true
			puzzleDoor.queue_free()
