extends Control

@onready var buttonClick = $ButtonClick

func _ready():
	Global.playWinSound = false
	Global.currentLevel = 0
	Global.levelTime = 0
	Global.playLevelMusic = false
	Global.playMenuMusic = true
func _on_play_pressed():
	Engine.time_scale = 1
	buttonClick.play()
	await buttonClick.finished
	get_tree().change_scene_to_file("res://Scenes/Levels/Level0.tscn")
	Global.playLevelMusic = true
	Global.playMenuMusic = false

func _on_quit_pressed():
	buttonClick.play()
	await buttonClick.finished
	get_tree().quit()

func _on_instructions_pressed():
	buttonClick.play()
	await buttonClick.finished
	get_tree().change_scene_to_file("res://Scenes/Menus/ControlsPage.tscn")
