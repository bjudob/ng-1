extends Node2D

@onready var hoverSound = $HoverSound
@onready var continueButton = $CanvasLayer/MarginContainer/VBoxContainer/Continue
@onready var newGameButton = $CanvasLayer/MarginContainer/VBoxContainer/NewGame
@onready var settingsButton = $CanvasLayer/MarginContainer/VBoxContainer/Settings
@onready var exitButton = $CanvasLayer/MarginContainer/VBoxContainer/Exit

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


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
	newGameButton.texture = load("res://images/buttons_goth/button_new_game_goth_hover.png")


func _on_new_game_mouse_exited() -> void:
	newGameButton.texture =  load("res://images/buttons_goth/button_new_game_goth.png")


func _on_settings_mouse_entered() -> void:
	hoverSound.play()
	settingsButton.texture =  load("res://images/buttons_goth/button_settings_goth_hover.png")


func _on_settings_mouse_exited() -> void:
	settingsButton.texture =  load("res://images/buttons_goth/button_settings_goth.png")


func _on_exit_mouse_entered() -> void:
	hoverSound.play()
	exitButton.texture =  load("res://images/buttons_goth/button_exit_goth_hover.png")

func _on_exit_mouse_exited() -> void:
	exitButton.texture =  load("res://images/buttons_goth/button_exit_goth.png")
