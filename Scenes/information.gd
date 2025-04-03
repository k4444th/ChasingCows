extends Node2D

var newPos := Vector2(0, 0)
var width := 10

@export var centerPosition := Vector2(0, 0)
@export var maxInfoPopupWidth = 750
@export var infoPopupWidth := 500
@export var infoPopupHeight := 500
@export var infoPopupMargin := 50

@onready var infoPopup = $InfoPopup

func _process(_delta: float) -> void:
	var windowSize: Vector2 = get_window().size
	infoPopupWidth = windowSize.x / 3 if windowSize.x / 3 < maxInfoPopupWidth else maxInfoPopupWidth
	infoPopupHeight = windowSize.y - 2 * infoPopupMargin
	
	infoPopup.points[0] = Vector2(0, 0)
	infoPopup.points[1] = Vector2(0, infoPopupHeight)
	infoPopup.points[2] = Vector2(infoPopupWidth, infoPopupHeight)
	infoPopup.points[3] = Vector2(infoPopupWidth, 0)
	
	newPos.x = centerPosition.x + windowSize.x / 2 - width / 2 - infoPopupWidth - infoPopupMargin 
	newPos.y = centerPosition.y - windowSize.y / 2 + width / 2 + infoPopupMargin
	position = newPos
