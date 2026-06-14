extends CharacterBody2D

const SPEED = 650.0

@onready var sprite = $Sprite
@onready var anim = $AnimationPlayer

var movementTarget = Vector2()

func _ready() -> void:
	movementTarget = position
	anim.play("ghost_deer_anim")

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("left_click"):
		movementTarget = get_global_mouse_position()
	
	# move
	if position.distance_to(movementTarget) > 10 and movementTarget != Vector2(0,0):
		var direction = (movementTarget - position).normalized()
		velocity = direction * SPEED
		move_and_slide()
