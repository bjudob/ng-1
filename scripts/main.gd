extends Node2D

enum Level {
	# ui
	MAIN_MENU,
}

@onready var level_to_scene = {
	Level.MAIN_MENU: $MainMenu,
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
