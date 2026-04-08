extends CharacterBody2D

var direction: Vector2
@export var speed: int = 200

func _physics_process(_delta: float) -> void:
	direction = Input.get_vector("move_left","move_right", "move_up", "move_down")
	velocity = direction * speed
	move_and_slide()
