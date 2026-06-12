extends CharacterBody2D

const SPEED = 500.0

@onready var sprite = $Sprite
var movementTarget = Vector2()

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("left_click"):
		movementTarget = get_global_mouse_position()
	
	# move
	if position.distance_to(movementTarget) > 10 and movementTarget != Vector2(0,0):
		var direction = (movementTarget - position).normalized()
		velocity = direction * SPEED
		move_and_slide()
