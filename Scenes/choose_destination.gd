extends Node2D

func _on_arrow_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

func _on_arrow_left_pressed() -> void:
	print("Arrow Left Pressed")

func _on_arrow_right_pressed() -> void:
	print("Arrow Right Pressed")
