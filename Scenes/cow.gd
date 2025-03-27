extends CharacterBody2D

var keyboardInputDirections := Vector2(0.0, 0.0)
var direction := Vector2(0.0, 0.0)
var lastDirection := "front_right"
var state := "standing"

@export var speed := 50

func _process(_delta: float) -> void:
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
		state = "standing"
	else:
		if (keyboardInputDirections.x > 0 and keyboardInputDirections.y >= 0):
			direction.x = keyboardInputDirections.x
			direction.y = keyboardInputDirections.x / 2
		elif (keyboardInputDirections.x < 0 and keyboardInputDirections.y <= 0):
			direction.x = keyboardInputDirections.x
			direction.y = keyboardInputDirections.x / 2
		elif (keyboardInputDirections.x >= 0 and keyboardInputDirections.y < 0):
			direction.x = -keyboardInputDirections.y
			direction.y = keyboardInputDirections.y / 2
		elif (keyboardInputDirections.x <= 0 and keyboardInputDirections.y > 0):
			direction.x = -keyboardInputDirections.y
			direction.y = keyboardInputDirections.y / 2
		
		state = "walking"
		setFacingDirection()
	
	$AnimatedSprite2D.animation = state + "_" + lastDirection

func setFacingDirection():
	if (direction.x > 0 and direction.y >= 0):
		lastDirection = "front_right"
	elif (direction.x <= 0 and direction.y <= 0):
		lastDirection = "back_left"
	elif (direction.x >= 0 and direction.y < 0):
		lastDirection = "back_right"
	elif (direction.x <= 0 and direction.y > 0):
		lastDirection = "front_left"

func moveSprite():
	velocity = direction * speed
	move_and_slide()
