extends Node

func _on_start_button_pressed() -> void:
	if !Gamemanager.gameData["hasSeenIntroSequence"]:
		Gamemanager.nextScene = "res://scenes/cutscenes/intro_cutscene.tscn"
		get_tree().change_scene_to_packed(load("res://scenes/general/loadingscreen.tscn"))
	elif !Gamemanager.gameData["hasSeenTheTheftSequence"]:
		Gamemanager.nextScene = "res://scenes/cutscenes/the_theft_cutscene.tscn"
		get_tree().change_scene_to_packed(load("res://scenes/general/loadingscreen.tscn"))
	else:
		print("Start game")
