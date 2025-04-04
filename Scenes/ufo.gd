extends CharacterBody2D

var keyboardInputDirections := Vector2(0.0, 0.0)
var direction := Vector2(0.0, 0.0)

@export var speed := 100
@export var gameRunning := false

func _process(_delta: float) -> void:
	if gameRunning:
		getKeyboardInputs()
		setDirection()
		moveSprite()

func getKeyboardInputs():
	keyboardInputDirections.x = Input.get_axis("Left", "Right")
	keyboardInputDirections.y = Input.get_axis("Up", "Down")

func setDirection():
	if keyboardInputDirections.x == 0 and keyboardInputDirections.y == 0:
		direction.x = 0
		direction.y = 0
	else:
		if (keyboardInputDirections.x > 0 and keyboardInputDirections.y == 0):
			direction.x = keyboardInputDirections.x
			direction.y = keyboardInputDirections.x / 2
		elif (keyboardInputDirections.x < 0 and keyboardInputDirections.y == 0):
			direction.x = keyboardInputDirections.x
			direction.y = keyboardInputDirections.x / 2
		elif (keyboardInputDirections.x == 0 and keyboardInputDirections.y < 0):
			direction.x = -keyboardInputDirections.y
			direction.y = keyboardInputDirections.y / 2
		elif (keyboardInputDirections.x == 0 and keyboardInputDirections.y > 0):
			direction.x = -keyboardInputDirections.y
			direction.y = keyboardInputDirections.y / 2
		
		elif (keyboardInputDirections.x > 0 and keyboardInputDirections.y > 0):
			direction.x = 0
			direction.y = keyboardInputDirections.x * keyboardInputDirections.y
		elif (keyboardInputDirections.x < 0 and keyboardInputDirections.y < 0):
			direction.x = 0
			direction.y = - keyboardInputDirections.x * keyboardInputDirections.y
		elif (keyboardInputDirections.x < 0 and keyboardInputDirections.y > 0):
			direction.x = keyboardInputDirections.x * keyboardInputDirections.y
			direction.y = 0
		elif (keyboardInputDirections.x > 0 and keyboardInputDirections.y < 0):
			direction.x = - keyboardInputDirections.x * keyboardInputDirections.y
			direction.y = 0
	
func moveSprite():
	velocity = direction * speed
	move_and_slide()
