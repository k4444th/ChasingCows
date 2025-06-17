extends Node

var imageIndex = 0

var images = [
	preload("res://assets/introCutscene/IntroCutscene1.png"),
	preload("res://assets/noImage.jpg"),
	preload("res://assets/noImage.jpg"),
	preload("res://assets/noImage.jpg"),
	preload("res://assets/noImage.jpg"),
	preload("res://assets/noImage.jpg"),
	preload("res://assets/noImage.jpg"),
	preload("res://assets/noImage.jpg"),
	preload("res://assets/noImage.jpg"),
	preload("res://assets/noImage.jpg"),
]

var dialogBalloonScene = preload("res://scenes/dialog/balloon.tscn")
var introDialogResource = preload("res://dialogs/intro.dialogue")

func _unhandled_input(_event: InputEvent) -> void:
	var dialogBalloonInstance = dialogBalloonScene.instantiate()
	add_child(dialogBalloonInstance)
	dialogBalloonInstance.start(introDialogResource, "")

func _ready() -> void:
	%Image.texture = images[0]

func showNextImage():
	%Image.texture = images[imageIndex]
	imageIndex += 1

func startGame():
	Gamemanager.gameData["hasSeenIntroSequence"] = true
	Gamemanager.saveData()
	Gamemanager.nextScene = "res://scenes/cutscenes/the_theft_cutscene.tscn"
	get_tree().change_scene_to_packed(load("res://scenes/general/loadingscreen.tscn"))
