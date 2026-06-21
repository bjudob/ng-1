extends Camera2D

@onready var player = $"../Player"
const SPEED = 2
const DISTANCE_TO_TRIGGER_MOVE = 500


var halfScreen
var moveTriggered
var cameraHeight

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var screenSize = get_viewport().get_visible_rect().size
	halfScreen = Vector2(screenSize.x/2, screenSize.y/2)
	cameraHeight = player.position.y- screenSize.y/2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var target = player.position
	var fixedOnPlayer = target - halfScreen - Vector2(0, cameraHeight)
	var direction = (fixedOnPlayer - position).normalized()
	
	var onSide = abs(position.x - fixedOnPlayer.x) > DISTANCE_TO_TRIGGER_MOVE
	if onSide:
		moveTriggered = true
	var onCenter = abs(position.x - fixedOnPlayer.x) < 20
	if onCenter:
		moveTriggered = false
	
	if moveTriggered:
		position.x = position.x + direction.x * SPEED
		position.y = position.y + direction.y * SPEED
	
	
