class_name Animal
extends Node2D

@onready var anim = $AnimationPlayer
@onready var talkArea = $Area2D
@export var current_dialog = ""
var canTalk = false

func _ready() -> void:
	anim.play("idle")
	if talkArea != null:
		talkArea.body_entered.connect(_on_talk_area_body_entered)
		talkArea.body_exited.connect(_on_talk_area_body_exited)

func _process(_delta: float) -> void:
	if canTalk and Input.is_action_just_pressed("talk"):
		Dialogic.start(current_dialog)
	

func _on_talk_area_body_entered(body: Node2D) -> void:
	canTalk = true

func _on_talk_area_body_exited(body: Node2D) -> void:
	canTalk = false
