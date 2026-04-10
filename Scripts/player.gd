extends CharacterBody2D

var direction: Vector2
@export var speed: int = 100
@onready var player_animation: AnimatedSprite2D = $PlayerAnimation

func _physics_process(_delta: float) -> void:
	direction = Input.get_vector("move_left","move_right", "move_up", "move_down")
	velocity = direction * speed
	animations()
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
