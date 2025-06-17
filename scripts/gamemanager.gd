extends Node

var savePath = "user://chasingcows.json"

var nextScene = "res://scenes/general/startscreen.tscn"
var loadingScreen = preload("res://scenes/general/loadingscreen.tscn")

var gameData := {
	"hasSeenIntroSequence": false,
	"hasSeenTheTheftSequence": false
}

func _ready() -> void:
	loadData()
	resetData()

func saveData():
	var data = {
		"gameData": 	gameData
	}
	var file = FileAccess.open(savePath, FileAccess.WRITE)
	file.store_string(JSON.stringify(data))
	file.close()

func loadData():
	if FileAccess.file_exists(savePath):
		var file = FileAccess.open(savePath, FileAccess.READ)
		var content = file.get_as_text()
		file.close()

		var loadedData = JSON.parse_string(content)
		if typeof(loadedData) == TYPE_DICTIONARY:
			gameData = loadedData.get("gameData", {
					"hasSeenIntroSequence": false,
					"hasSeenTheTheftSequence": false,
				}
			)

func resetData():
	gameData["hasSeenIntroSequence"] = false
	gameData["hasSeenTheTheftSequence"] = false
	saveData()

		
