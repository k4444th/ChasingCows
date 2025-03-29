extends TileMap

var borderAtlasCoords = Vector2i(0, 3)

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
	setBoundaries()

func setBoundaries():
	var usedCells = get_used_cells(layers.layer1)
	for cell in usedCells:
		for offset in offsets:
			var currentCell = cell + offset
			if get_cell_source_id(layers.layer1, currentCell) == -1:
				set_cell(layers.layer1, currentCell, 0, borderAtlasCoords)
