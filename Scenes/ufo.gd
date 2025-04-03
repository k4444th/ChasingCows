extends CharacterBody2D

var keyboardInputDirections := Vector2(0.0, 0.0)
var direction := Vector2(0.0, 0.0)

@export var speed := 100

@onready var beam := $Beam/Beam

func _process(_delta: float) -> void:
	if Input.is_action_pressed("Beam"):
		$Beam/Beam.visible = true
	elif Input.is_action_just_released("Beam"):
		$Beam/Beam.visible = false
		
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
	
func moveSprite():
	velocity = direction * speed
	move_and_slide()
