extends Camera2D

var inputDirection := Vector2(0, 0)
var galaxyIndex = 0
var galaxyCount = 3

@export var transitionSpeed: float = 1.5

func _process(_delta: float) -> void:
	if Input.is_action_just_released("Right") and galaxyIndex < galaxyCount - 1:
		galaxyIndex += 1
		var newPosition = Vector2(1920 * 2 * galaxyIndex, 0)
		var tween = get_tree().create_tween()
		tween.tween_property(self, "position", newPosition, transitionSpeed).set_trans(Tween.TRANS_QUAD)

	elif Input.is_action_just_released("Left") and galaxyIndex > 0:
		galaxyIndex -= 1
		var newPosition = Vector2(1920 * 2 * galaxyIndex, 0)
		var tween = get_tree().create_tween()
		tween.tween_property(self, "position", newPosition, transitionSpeed).set_trans(Tween.TRANS_QUAD)
	
