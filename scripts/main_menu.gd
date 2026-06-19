extends Level

@onready var main = get_tree().get_nodes_in_group("main")[0]

@onready var hoverSound = $HoverSound
@onready var continueButton = $CanvasLayer/MarginContainer/VBoxContainer/Continue
@onready var newGameButton = $CanvasLayer/MarginContainer/VBoxContainer/NewGame
@onready var settingsButton = $CanvasLayer/MarginContainer/VBoxContainer/Settings
@onready var exitButton = $CanvasLayer/MarginContainer/VBoxContainer/Exit

func _on_new_game_gui_input(event: InputEvent) -> void:
	if (event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT):
		main.change_scene(main.Level.Map)
	
func _on_exit_gui_input(event: InputEvent) -> void:
	if (event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT):
		get_tree().quit()


func _on_continue_mouse_entered() -> void:
	hoverSound.play()
	continueButton.texture =  load("res://images/buttons_goth/button_continue_goth_hover.png")


func _on_continue_mouse_exited() -> void:
	continueButton.texture =  load("res://images/buttons_goth/button_continue_goth.png")


func _on_new_game_mouse_entered() -> void:
	hoverSound.play()
	newGameButton.texture = load("res://images/buttons/button_play_hover.png")


func _on_new_game_mouse_exited() -> void:
	newGameButton.texture =  load("res://images/buttons/button_play.png")


func _on_settings_mouse_entered() -> void:
	hoverSound.play()
	settingsButton.texture =  load("res://images/buttons/button_settings_hover.png")


func _on_settings_mouse_exited() -> void:
	settingsButton.texture =  load("res://images/buttons/button_settings.png")


func _on_exit_mouse_entered() -> void:
	hoverSound.play()
	exitButton.texture =  load("res://images/buttons/button_exit_hover.png")

func _on_exit_mouse_exited() -> void:
	exitButton.texture =  load("res://images/buttons/button_exit.png")
