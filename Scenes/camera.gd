extends Camera2D

var inputDirection := Vector2(0, 0)

@export var speed: int = 50

func _process(_delta: float) -> void:
	getKeyboardInputs()
	moveCamera()

func getKeyboardInputs():
	inputDirection.x = Input.get_axis("Left", "Right")
	inputDirection.y = Input.get_axis("Up", "Down")

func moveCamera():
	position += inputDirection * speed
