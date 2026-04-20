extends CharacterBody2D

var direction: Vector2
@export var speed: int = 100
@onready var player_animation: AnimatedSprite2D = $PlayerAnimation

@export var nearby_interactables = []

var canMove = true

func _ready() -> void:
	if Global.player_left_room2:
		position.x = 8
		position.y = 144
	if Global.player_left_room3:
		position.x = 272
		position.y = 272
	Global.player_left_room2 = false
	Global.player_left_room3 = false


func _physics_process(_delta: float) -> void:
	print(nearby_interactables)
	if canMove:
		direction = Input.get_vector("move_left","move_right", "move_up", "move_down")
		velocity = direction * speed
	else:
		velocity = Vector2(0, 0)
	animations()
	
	if Input.is_action_just_pressed("interact"):
		if nearby_interactables:
			nearby_interactables[getClosest(nearby_interactables)].interact()
		
	move_and_slide()

func animations():
	if direction == Vector2(1,0):
		player_animation.play("right_flying")
		player_animation.flip_h = false
	if direction == Vector2 (-1,0):
		player_animation.play("left_flying")
		player_animation.flip_h = true
	if direction == Vector2 (0,-1):
		player_animation.play("back_flying")
		player_animation.flip_h = false
	if direction == Vector2 (0,1):
		player_animation.play("front_flying")
		player_animation.flip_h = false


func _on_interaction_detector_area_entered(area: Area2D) -> void:
	print("Interactable Detected")
	nearby_interactables.append(area)

func _on_interaction_detector_area_exited(area: Area2D) -> void:
	print("Interactable Removed")
	nearby_interactables.erase(area)


func _on_entered_talking() -> void:
	canMove = false

func _on_exited_talking() -> void:
	canMove = true


func _on_collidable_detector_area_entered(area: Area2D) -> void:
	match area.tag:
		"Room 1":
			match get_tree().current_scene:
				Global.room2:
					Global.player_left_room2 = true
				Global.room3:
					Global.player_left_room3 = true
			get_tree().call_deferred("change_scene_to_file", "res://Scenes/Rooms/room_1.tscn")
		"Room 2":
			get_tree().call_deferred("change_scene_to_file", "res://Scenes/Rooms/room_2.tscn")
		"Room 3":
			get_tree().call_deferred("change_scene_to_file", "res://Scenes/Rooms/room_3.tscn")
		"Room 4":
			get_tree().call_deferred("change_scene_to_file", "res://Scenes/Rooms/room_4.tscn")

func getClosest(nearbyNodes: Array):
	var distanceArray = []
	var minVal = 10000.0
	var minIndex = null
	for i in range(nearbyNodes.size()):
		distanceArray.append(nearbyNodes[i].position.distance_to(self.position))
	for i in range(distanceArray.size()):
		if distanceArray[i] < minVal:
			minVal = distanceArray[i]
			minIndex = i
	return minIndex
