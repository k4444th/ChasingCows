extends Node2D

var selectorPosition := Vector2(0, 0)
var selectorSize := Vector2(100, 100)

@onready var selector := $"."
@onready var selectorCorners := [
	[$TopLeft, $TopRight],
	[$BottomLeft, $BottomRight]
]

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		selectorPosition = event.position
	
	if event is InputEventMouseButton:
		selectorSize = Vector2(600 - selectorSize.x, 600 - selectorSize.y)
		

func _process(_delta: float) -> void:
	selector.position = selectorPosition
	selectorCorners[0][0].position = -selectorSize / 2
	selectorCorners[0][1].position.x = selectorSize.x / 2
	selectorCorners[0][1].position.y = -selectorSize.y / 2
	selectorCorners[1][0].position.x = -selectorSize.x / 2
	selectorCorners[1][0].position.y = selectorSize.y / 2
	selectorCorners[1][1].position = selectorSize / 2
