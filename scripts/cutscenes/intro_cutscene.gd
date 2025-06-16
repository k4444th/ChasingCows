extends Node

var imageIndex = 0

var images = [
	preload("res://assets/noImage.jpg"),
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
var introDialogressource = preload("res://dialogs/intro.dialogue")

@onready var image = $TextureRect

func _ready() -> void:
	var dialogBalloonInstance = dialogBalloonScene.instantiate()
	add_child(dialogBalloonInstance)
	dialogBalloonInstance.start(introDialogressource, "")

func showNextImage():
	image.texture = images[imageIndex]
	imageIndex += 1

func startGame():
	print("Switch scene")
	
