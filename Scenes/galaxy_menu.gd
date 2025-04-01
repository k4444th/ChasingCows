extends Node2D

@export var cameraStartZoom := Vector2(0.1, 0.1)

@onready var camera := $Camera
@onready var galaxyInformation := $GalaxyInformation
@onready var galaxyInformationTitle := $GalaxyInformation/Container/ColorRect/MarginContainer/VBoxContainer/GalaxyName
@onready var galaxyInformationText := $GalaxyInformation/Container/ColorRect/MarginContainer/VBoxContainer/MarginContainer/GalaxyInfo

@onready var galaxyPositions = {
	"Andromeda": $Galaxies/AndromedaButton.position + $Galaxies/AndromedaButton.size,
	"MilkyWay": $Galaxies/MilkyWayButton.position + $Galaxies/MilkyWayButton.size,
	"Hangay": $Galaxies/HangayButton.position + $Galaxies/HangayButton.size,
	"Fornax": $Galaxies/FornaxButton.position + $Galaxies/FornaxButton.size,
	"Triangulum": $Galaxies/TriangulumButton.position + $Galaxies/TriangulumButton.size,
	"AbsanthaGom": $"Galaxies/Absantha-GomButton".position + $"Galaxies/Absantha-GomButton".size,
	"AbsanthaShad": $"Galaxies/Absantha-ShadButtton".position + $"Galaxies/Absantha-ShadButtton".size
}

func setInformtion(GalaxyName: String):
	if GalaxyName == "Andromeda":
		galaxyInformationTitle.text = "Andromeda Galaxy"
		galaxyInformationText.text = "Your Home Galaxy\n" \
			+ "Lorem ipsum dolor sit amet dolorem proident utilitatis magnus agris. Abutebatur architecto propter ut materia. Quam quo aliquip, officii voluptatem. Qui pariatur officii eos.\n" \
			+ "Lorem ipsum dolor sit amet dolorem proident utilitatis magnus agris. Abutebatur architecto propter ut materia. Quam quo aliquip, officii voluptatem. Qui pariatur officii eos.\n" \
			+ "Lorem ipsum dolor sit amet dolorem proident utilitatis magnus agris. Abutebatur architecto propter ut materia. Quam quo aliquip, officii voluptatem. Qui pariatur officii eos.\n"
			
	elif GalaxyName == "MilkyWay":
		galaxyInformationTitle.text = "Milky Way"
		galaxyInformationText.text = "Home of said cow\n" \
			+ "Travel Costs: ___\n"

	elif GalaxyName == "Hangay":
		galaxyInformationTitle.text = "Hangay"
		galaxyInformationText.text = "Unreachable\n"

	elif GalaxyName == "Fornax":
		galaxyInformationTitle.text = "Fornax"
		galaxyInformationText.text = "Unreachable\n"

	elif GalaxyName == "Triangulum":
		galaxyInformationTitle.text = "Triangulum"
		galaxyInformationText.text = "Unreachable\n"

	elif GalaxyName == "Absantha-Gom":
		galaxyInformationTitle.text = "Absantha-Gom"
		galaxyInformationText.text = "Unreachable\n"

	elif GalaxyName == "Absantha-Shad":
		galaxyInformationTitle.text = "Absantha-Shad"
		galaxyInformationText.text = "Unreachable\n"

	else:
		galaxyInformationTitle.text = "Unknown Galaxy"
		galaxyInformationText.text = "No Information given"

func zoomInCameraView(pos):
	var tween1 = get_tree().create_tween()
	var tween2 = get_tree().create_tween()
	tween1.tween_property(camera, "zoom", Vector2(1, 1), 2.5).set_trans(Tween.TRANS_QUAD)
	tween2.tween_property(camera, "position", pos, 2.5).set_trans(Tween.TRANS_QUAD)

func zoomOutCameraView():
	var tween1 = get_tree().create_tween()
	var tween2 = get_tree().create_tween()
	tween1.tween_property(camera, "zoom", cameraStartZoom, 2.5).set_trans(Tween.TRANS_QUAD)
	tween2.tween_property(camera, "position", Vector2(0, 0), 2.5).set_trans(Tween.TRANS_QUAD)

func _ready() -> void:
	camera.zoom = cameraStartZoom
	camera.position = Vector2(0, 0)
	galaxyInformation.visible = false

func _on_arrow_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

func _on_andromeda_button_pressed() -> void:
	print("Change to Andromeda galaxy scene")

func _on_andromeda_button_mouse_entered() -> void:
	if camera.zoom <= cameraStartZoom:
		galaxyInformation.visible = true
		zoomInCameraView(galaxyPositions.Andromeda)
		setInformtion("Andromeda")

func _on_andromeda_button_mouse_exited() -> void:
	if camera.zoom.x >= 1:
		galaxyInformation.visible = false
		zoomOutCameraView()

func _on_milky_way_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level.tscn")

func _on_milky_way_button_mouse_entered() -> void:
	if camera.zoom <= cameraStartZoom:
		galaxyInformation.visible = true
		zoomInCameraView(galaxyPositions.MilkyWay)
		setInformtion("MilkyWay")

func _on_milky_way_button_mouse_exited() -> void:
	if camera.zoom.x >= 1:
		galaxyInformation.visible = false
		zoomOutCameraView()

func _on_hangay_button_pressed() -> void:
	print("Change to Hangay galaxy scene")

func _on_hangay_button_mouse_entered() -> void:
	if camera.zoom <= cameraStartZoom:
		galaxyInformation.visible = true
		zoomInCameraView(galaxyPositions.Hangay)
		setInformtion("Hangay")

func _on_hangay_button_mouse_exited() -> void:
	if camera.zoom.x >= 1:
		galaxyInformation.visible = false
		zoomOutCameraView()

func _on_fornax_button_pressed() -> void:
	print("Change to Fornax galaxy scene")

func _on_fornax_button_mouse_entered() -> void:
	if camera.zoom <= cameraStartZoom:
		galaxyInformation.visible = true
		zoomInCameraView(galaxyPositions.Fornax)
		setInformtion("Fornax")

func _on_fornax_button_mouse_exited() -> void:
	if camera.zoom.x >= 1:
		galaxyInformation.visible = false
		zoomOutCameraView()

func _on_triangulum_button_pressed() -> void:
	print("Change to Triangulum galaxy scene")

func _on_triangulum_button_mouse_entered() -> void:
	if camera.zoom <= cameraStartZoom:
		galaxyInformation.visible = true
		zoomInCameraView(galaxyPositions.Triangulum)
		setInformtion("Triangulum")

func _on_triangulum_button_mouse_exited() -> void:
	if camera.zoom.x >= 1:
		galaxyInformation.visible = false
		zoomOutCameraView()

func _on_absantha_gom_button_pressed() -> void:
	print("Change to Absantha-Gom galaxy scene")

func _on_absantha_gom_button_mouse_entered() -> void:
	if camera.zoom <= cameraStartZoom:
		galaxyInformation.visible = true
		zoomInCameraView(galaxyPositions.AbsanthaGom)
		setInformtion("Absantha-Gom")

func _on_absantha_gom_button_mouse_exited() -> void:
	if camera.zoom.x >= 1:
		galaxyInformation.visible = false
		zoomOutCameraView()

func _on_absantha_shad_buttton_pressed() -> void:
	print("Change to Absantha-Shad galaxy scene")

func _on_absantha_shad_buttton_mouse_entered() -> void:
	if camera.zoom <= cameraStartZoom:
		galaxyInformation.visible = true
		zoomInCameraView(galaxyPositions.AbsanthaShad)
		setInformtion("Absantha-Shad")

func _on_absantha_shad_buttton_mouse_exited() -> void:
	if camera.zoom.x >= 1:
		galaxyInformation.visible = false
		zoomOutCameraView()
