extends Node2D

@export var cameraZoom := Vector2()

@onready var camera := $Camera
@onready var galaxyInformation := $Canvas/Container/GalaxyInformation
@onready var galaxyInformationTitle := $Canvas/Container/GalaxyInformation/ColorRect/MarginContainer/VBoxContainer/GalaxyName
@onready var galaxyInformationText := $Canvas/Container/GalaxyInformation/ColorRect/MarginContainer/VBoxContainer/MarginContainer/GalaxyInfo

func _ready() -> void:
	camera.zoom = cameraZoom
	galaxyInformation.visible = false
	

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
	
	else:
		galaxyInformationTitle.text = "Unknown Galaxy"
		galaxyInformationText.text = ""

func _on_arrow_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

func _on_andromeda_button_pressed() -> void:
	pass # Replace with function body.

func _on_andromeda_button_mouse_entered() -> void:
	galaxyInformation.visible = true
	setInformtion("Andromeda")

func _on_andromeda_button_mouse_exited() -> void:
	galaxyInformation.visible = false

func _on_milky_way_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level.tscn")

func _on_milky_way_button_mouse_entered() -> void:
	galaxyInformation.visible = true
	setInformtion("MilkyWay")

func _on_milky_way_button_mouse_exited() -> void:
	galaxyInformation.visible = false
