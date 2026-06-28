extends Node2D


@onready var wordsContainer = $CanvasLayer/MarginContainer/VBoxContainer/WordsContainer

var collectedWords = ["Cow", "Grass", "Cut"]

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	for label in wordsContainer.get_children():
		wordsContainer.remove_child(label)
	for word in collectedWords:
		var label = Label.new()
		label.text = word + "  "
		var labelSettings = LabelSettings.new()
		labelSettings.font_size = 50
		label.label_settings = labelSettings
		wordsContainer.add_child(label)

func add_word(word: String) -> void:
	collectedWords.append(word)
