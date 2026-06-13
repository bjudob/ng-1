class_name Main
extends Node2D

@onready var gameMenu = $GameMenu

enum Level {
	# ui
	MAIN_MENU,
	# areas
	Map,
}

@onready var levelToScene = {
	Level.MAIN_MENU: $MainMenu,
	Level.Map: $Map,
}

func _ready() -> void:
	change_scene(Main.Level.MAIN_MENU)

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("menu"):
		gameMenu.visible = true
	
	
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
