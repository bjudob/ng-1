extends CharacterBody2D


const SPEED = 300.0
const minOpacity = 0.3
const maxOpacity = 0.5
var opacityCounter = 0
var opacityChange = 40

@onready var sprite = $Sprite

func _ready() -> void:
	$Sprite.self_modulate.a = 0.5

func _physics_process(delta: float) -> void:
	# opacity
	if opacityCounter % opacityChange == 0:
		$Sprite.self_modulate.a = randf_range(minOpacity, maxOpacity)
	opacityCounter += 1
	
	# move
	var directionH := Input.get_axis("move_left", "move_right")
	var directionV := Input.get_axis("move_up", "move_down")
	if directionH:
		velocity.x = directionH * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if directionV:
		velocity.y = directionV * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
