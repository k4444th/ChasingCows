extends Node2D

var selected: TextureButton
var transitionSpeed := 2.5

@onready var selector := $Selector
@onready var camera := $Camera

@onready var andromedaButton := $Galaxies/Andromeda
@onready var milkyWayButton := $Galaxies/MilkyWay
@onready var hangayButton := $Galaxies/HangayButton
@onready var fornaxButton := $Galaxies/FornaxButton
@onready var triangulumButton := $Galaxies/TriangulumButton
@onready var absanthaGomButton := $"Galaxies/Absantha-GomButton"
@onready var absanthaShadButton := $"Galaxies/Absantha-ShadButtton"

func _ready() -> void:
	setSelector(andromedaButton)

func _on_arrow_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

func _on_arrow_left_pressed() -> void:
	if selected == andromedaButton:
		setSelector(absanthaShadButton)
	elif selected == milkyWayButton:
		setSelector(andromedaButton)
	elif selected == hangayButton:
		setSelector(milkyWayButton)
	elif selected == fornaxButton:
		setSelector(hangayButton)
	elif selected == triangulumButton:
		setSelector(fornaxButton)
	elif selected == absanthaGomButton:
		setSelector(triangulumButton)
	elif selected == absanthaShadButton:
		setSelector(absanthaGomButton)
	else:
		setSelector(andromedaButton)

func _on_arrow_right_pressed() -> void:
	if selected == andromedaButton:
		setSelector(milkyWayButton)
	elif selected == milkyWayButton:
		setSelector(hangayButton)
	elif selected == hangayButton:
		setSelector(fornaxButton)
	elif selected == fornaxButton:
		setSelector(triangulumButton)
	elif selected == triangulumButton:
		setSelector(absanthaGomButton)
	elif selected == absanthaGomButton:
		setSelector(absanthaShadButton)
	elif selected == absanthaShadButton:
		setSelector(milkyWayButton)
	else:
		setSelector(andromedaButton)

func setSelector(node: TextureButton):
	selected = node
	selector.selectorPosition = node.position + node.size * (node.scale / 2)
	selector.selectorSize = node.size * node.scale
	var tweenPos = get_tree().create_tween()
	var tweenZoom1 = get_tree().create_tween()
	tweenPos.tween_property(camera, "position", node.position + node.size * (node.scale / 2), transitionSpeed).set_trans(Tween.TRANS_QUAD)
	tweenZoom1.tween_property(camera, "zoom", Vector2(0.8, 0.8), transitionSpeed / 2).set_trans(Tween.TRANS_QUAD)
	await tweenZoom1.finished
	var tweenZoom2 = get_tree().create_tween()
	tweenZoom2.tween_property(camera, "zoom", Vector2(1.0, 1.0), transitionSpeed / 2).set_trans(Tween.TRANS_QUAD)

func _on_milky_way_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level.tscn")
