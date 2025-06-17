extends Node

var imageIndex = 0

var images = [
	preload("res://assets/noImage.jpg"),
]

var entryDialogBalloonScene = preload("res://scenes/dialog/logentry.tscn")
var firstEntryDialogResource = preload("res://dialogs/first_log_entry.dialogue")

func _unhandled_input(_event: InputEvent) -> void:
	var entryDialogBallooInstance = entryDialogBalloonScene.instantiate()
	add_child(entryDialogBallooInstance)
	entryDialogBallooInstance.start(firstEntryDialogResource, "")

func _ready() -> void:
	%Image.texture = images[0]

func startGame():
	Gamemanager.gameData["hasSeenTheTheftSequence"] = true
	Gamemanager.saveData()
	print("Start game")
