extends Control
func _ready():
	Global.currentLevel = 0
	Global.levelTime = 0
	Global.playLevelMusic = false
	Global.playMenuMusic = true
func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/Level0.tscn")
	Global.playLevelMusic = true
	Global.playMenuMusic = false

func _on_quit_pressed():
	get_tree().quit()

func _on_instructions_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menus/ControlsPage.tscn")
