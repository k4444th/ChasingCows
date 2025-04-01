extends Node2D


func _on_andromeda_button_pressed() -> void:
	print("Andromeda Galaxy Button Pressed")

func _on_milky_way_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level.tscn")

func _on_some_galaxy_button_pressed() -> void:
	print("Some Galaxy Button Pressed")
