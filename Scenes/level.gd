extends  Node2D

@onready var cow := $Cow
@onready var ufo := $UFO

var lastCowYPos := -10

func _process(_delta: float) -> void:
	if Input.is_action_pressed("Beam"):
		if lastCowYPos < 0:
			lastCowYPos = cow.position.y
			cow.get_node("CollisionShape2D").disabled = true
		if cow.position.y > ufo.position.y:
			cow.position.y -= 5
	elif Input.is_action_just_released("Beam"):
		cow.position.y = lastCowYPos
		cow.get_node("CollisionShape2D").disabled = false
		lastCowYPos = -10
