extends Camera2D

@onready var player = $"../Player"
const SPEED = 2
const TRIGGER_DISTANCE_H = 500
const TRIGGER_DISTANCE_V = 300


var halfScreen
var moveTriggeredH
var moveTriggeredV
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
	
	var onSideH = abs(position.x - fixedOnPlayer.x) > TRIGGER_DISTANCE_H
	var onSideV = abs(position.y - fixedOnPlayer.y) > TRIGGER_DISTANCE_V
	
	if onSideH:
		moveTriggeredH = true
	if onSideV:
		moveTriggeredV = true
		
	var onCenter = abs(position.x - fixedOnPlayer.x) < 20
	if onCenter:
		moveTriggeredH = false
	
	if moveTriggeredH:
		position.x = position.x + direction.x * SPEED
	#if moveTriggeredV:
	#	position.y = position.y + direction.y * SPEED
	
	
