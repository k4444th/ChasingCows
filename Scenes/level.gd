extends  Node2D

var transitionSpeed := 2.5

@onready var cow := $Cow
@onready var ufo := $UFO
@onready var map := $EarthTileMap
@onready var indicator := $Indicator

var lastCowYPos := -10

func _ready() -> void:
	ufo.position.y = -750
	var tweenPos = get_tree().create_tween()
	tweenPos.tween_property(ufo, "position", Vector2(0, -150), transitionSpeed).set_trans(Tween.TRANS_QUAD)
	await tweenPos.finished
	ufo.gameRunning = true
	indicator.gameRunning = true

func _process(_delta: float) -> void:
	if Input.is_action_pressed("Beam"):
		if lastCowYPos < 0:
			lastCowYPos = cow.position.y
			cow.get_node("CollisionShape2D").disabled = true
		if cow.position.y > ufo.position.y:
			cow.position.y -= 3
	elif Input.is_action_just_released("Beam"):
		cow.position.y = lastCowYPos
		cow.get_node("CollisionShape2D").disabled = false
		lastCowYPos = -10
