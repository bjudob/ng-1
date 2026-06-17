extends Camera2D

@onready var ghostDeer = $"../GhostDeer"
const SPEED = 2
const DISTANCE_TO_TRIGGER_MOVE = 500


var halfScreen
var moveTriggered

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var screenSize = get_viewport().get_visible_rect().size
	halfScreen = Vector2(screenSize.x/2, screenSize.y/2)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var target = ghostDeer.position
	var fixedOnDeer = target - halfScreen
	var direction = (fixedOnDeer - position).normalized()
	
	var onSide = abs(position.x - fixedOnDeer.x) > DISTANCE_TO_TRIGGER_MOVE
	if onSide:
		moveTriggered = true
	var onCenter = abs(position.x - fixedOnDeer.x) < 20
	if onCenter:
		moveTriggered = false
	
	if moveTriggered:
		position.x = position.x + direction.x * SPEED
	
	
