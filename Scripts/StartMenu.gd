extends Control
func _ready():
	Global.currentLevel = 0
	Global.levelTime = 0
func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/Level0.tscn")

func _on_quit_pressed():
	get_tree().quit()

func _on_instructions_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menus/ControlsPage.tscn")
