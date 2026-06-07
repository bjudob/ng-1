class_name Main
extends Node2D

enum Level {
	# ui
	MAIN_MENU,
	# areas
	Clearing666,
}

@onready var levelToScene = {
	Level.MAIN_MENU: $MainMenu,
	Level.Clearing666: $Clearing666,
}

var levelScene

func _ready() -> void:
	change_scene(Main.Level.MAIN_MENU)

func change_scene(level: Main.Level):
	var levelScene = levelToScene[level]
	if not has_child(levelScene):
		add_child.call_deferred(levelScene)
	for scene in levelToScene:
		if scene == level or not has_child(levelToScene[scene]):
			continue
		remove_child(levelToScene[scene])
		
		
func has_child(node: Node):
	for child in get_children():
		if child == node:
			return true
	return false
