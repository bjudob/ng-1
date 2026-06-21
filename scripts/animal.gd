class_name Animal
extends Node2D

@onready var anim = $AnimationPlayer
@onready var talkArea = $TalkArea
@export var current_dialog = ""
var dialogInProgress = false
var canTalk = false

func _ready() -> void:
	anim.play("idle")
	if talkArea != null:
		talkArea.body_entered.connect(_on_talk_area_body_entered)
		talkArea.body_exited.connect(_on_talk_area_body_exited)

func _process(_delta: float) -> void:
	dialogInProgress = Dialogic.current_timeline != null
	if canTalk and !dialogInProgress and Input.is_action_just_pressed("talk"):
		Dialogic.start(current_dialog)
	

func _on_talk_area_body_entered(_body: Node2D) -> void:
	canTalk = true

func _on_talk_area_body_exited(_body: Node2D) -> void:
	canTalk = false
	if dialogInProgress:
		Dialogic.end_timeline()
	
