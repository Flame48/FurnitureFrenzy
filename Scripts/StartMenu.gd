extends Control
func _ready():
	Global.currentLevel = 1
	Global.levelOneTime = 0
	Global.levelTwoTime = 0
	Global.levelThreeTime = 0
func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/LevelOne.tscn")

func _on_quit_pressed():
	get_tree().quit()
