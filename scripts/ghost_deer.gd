extends CharacterBody2D


const SPEED = 300.0

@onready var sprite = $Sprite
var movementTarget = Vector2()

func _ready() -> void:
	# $Sprite.self_modulate.a = 0.3
	pass

func _physics_process(delta: float) -> void:
	#if Input.is_action_just_pressed("left_click"):
	movementTarget = get_global_mouse_position()
	if position.distance_to(movementTarget) > 3 and movementTarget != Vector2(0,0):
		var direction = (movementTarget - position).normalized()
		velocity = direction * SPEED
		move_and_slide()
