extends TileMap

var borderAtlasCoords = Vector2i(0, 3)
var oceanAtlasCoords = Vector2i(15, 2)
var worldOrigin := Vector2i(0, 0)
var oceanRadius := 0

@export var oceanBorderWidth: int

const PI = 3.1415926525

enum layers {
	layer0 = 0,
	layer1 = 1,
	layer2 = 2,
	layer3 = 3,
	layer4 = 4,
	layer5 = 5,
	layer6 = 6,
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

func findBoundaries() -> int:
	var maxPos = 0
	var usedCells = get_used_cells(layers.layer1)
	
	for cell in usedCells:
		if abs(cell.x) > maxPos or abs(cell.y) > maxPos:
			maxPos = cell.x if cell.x >= cell.y else cell.y
	
	return maxPos + oceanBorderWidth

func placeOcean():
	for x in range(worldOrigin.x - oceanRadius, worldOrigin.x + oceanRadius):
		for y in range(worldOrigin.y - oceanRadius, worldOrigin.y + oceanRadius):
			var currentCell := Vector2i(x, y)
			if isCellInCircle(currentCell, worldOrigin, oceanRadius):
				set_cell(layers.layer0, currentCell, 0, oceanAtlasCoords)

func isCellInCircle(cell: Vector2i, origin: Vector2i, radius: int) -> bool:
	var dx := origin.x - cell.x
	var dy := origin.y - cell.y
	return pow(dx, 2) + pow(dy, 2) < pow(radius, 2)

func setBoundaries():
	var usedCells = get_used_cells(layers.layer1)
	for cell in usedCells:
		for offset in offsets:
			var currentCell = cell + offset
			if get_cell_source_id(layers.layer1, currentCell) == -1:
				set_cell(layers.layer1, currentCell, 0, borderAtlasCoords)
