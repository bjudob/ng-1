extends Camera2D

@onready var ghostDeer = $"../GhostDeer"
const SPEED = 0.5

var width
var height

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var screenSize = get_viewport().get_visible_rect().size
	width = screenSize.x
	height = screenSize.y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var target = ghostDeer.position
	var fixedOnDeer = target - Vector2(width/2, height/2)
	var direction = (fixedOnDeer - position).normalized()
	position = position + direction * SPEED
	
	
