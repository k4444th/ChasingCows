extends TileMap

var borderAtlasCoords = Vector2i(0, 3)
var oceanAtlasCoords = Vector2i(15, 2)
var worldOrigin := Vector2i(0, 0)
var oceanRadius := 0

@export var oceanBorderWidth: int = 50
@export var indicatorPosition := Vector2(0, 0)
@export var indicatorBlockYOffset := 0

const PI = 3.1415926525

enum layers {
	ocean  = 0,
	ground = 1,
	mountain1 = 2
}

var offsets := [
	Vector2i(1, 0),
	Vector2i(-1, 0),
	Vector2i(0, 1),
	Vector2i(0, -1)
]

func _ready() -> void:
	oceanRadius = findBoundaries()
	setBoundaries()
	placeOcean()

func _process(_delta: float) -> void:
	var layerCount = get_layers_count()
	for layer in layerCount:
		if get_cell_source_id(layer, indicatorPosition) != -1:
			indicatorBlockYOffset = layer

func findBoundaries() -> int:
	var maxPos = 0
	var usedCells = get_used_cells(layers.ocean)
	
	for cell in usedCells:
		if abs(cell.x) > maxPos or abs(cell.y) > maxPos:
			maxPos = cell.x if cell.x >= cell.y else cell.y
	
	return maxPos + oceanBorderWidth

func placeOcean():
	for x in range(worldOrigin.x - oceanRadius, worldOrigin.x + oceanRadius):
		for y in range(worldOrigin.y - oceanRadius, worldOrigin.y + oceanRadius):
			var currentCell := Vector2i(x, y)
			if isCellInCircle(currentCell, worldOrigin, oceanRadius):
				set_cell(layers.ocean, currentCell, 0, oceanAtlasCoords)

func isCellInCircle(cell: Vector2i, origin: Vector2i, radius: int) -> bool:
	var dx := origin.x - cell.x
	var dy := origin.y - cell.y
	return pow(dx, 2) + pow(dy, 2) < pow(radius, 2)

func setBoundaries():
	var usedCells = get_used_cells(layers.ground)
	for cell in usedCells:
		for offset in offsets:
			var currentCell = cell + offset
			if get_cell_source_id(layers.ground, currentCell) == -1:
				set_cell(layers.ground, currentCell, 0, borderAtlasCoords)
