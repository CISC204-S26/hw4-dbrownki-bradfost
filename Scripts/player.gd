extends CharacterBody2D

var direction: Vector2
@export var speed: int = 100
@onready var player_animation: AnimatedSprite2D = $PlayerAnimation

@export var nearby_interactables = []

var canMove = true

func _physics_process(_delta: float) -> void:
	if canMove:
		direction = Input.get_vector("move_left","move_right", "move_up", "move_down")
		velocity = direction * speed
	else:
		velocity = Vector2(0, 0)
	animations()
	
	if Input.is_action_just_pressed("interact"):
		if nearby_interactables:
			nearby_interactables.back().interact()
		
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
