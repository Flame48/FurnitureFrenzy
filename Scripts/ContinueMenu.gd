extends Control

@onready var msec = $Camera2D/MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/msec
@onready var minutes = $Camera2D/MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/minutes
@onready var seconds = $Camera2D/MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/seconds
@onready var levelLabel = $Camera2D/MarginContainer/HBoxContainer/VBoxContainer/TimeText
@onready var continueSpacer = $Camera2D/MarginContainer/HBoxContainer/VBoxContainer/Label2
@onready var continueButton = $Camera2D/MarginContainer/HBoxContainer/VBoxContainer/Continue

var levelOneTime = Global.levelOneTime
var levelTwoTime = Global.levelTwoTime
var levelThreeTime = Global.levelThreeTime

var msecTime = 0
var minutesTime = 0
var secondsTime = 0
func _ready():
	if Global.currentLevel == 1:
		msecTime = fmod(levelOneTime, 1) * 100
		secondsTime = fmod(levelOneTime, 60)
		minutesTime = fmod(levelOneTime, 3600) / 60
		levelLabel.text = "You completed Level 1 in:"
	elif Global.currentLevel == 2:
		msecTime = fmod(levelTwoTime, 1) * 100
		secondsTime = fmod(levelTwoTime, 60)
		minutesTime = fmod(levelTwoTime, 3600) / 60
		levelLabel.text = "You completed Level 2 in:"
	elif Global.currentLevel == 3:
		msecTime = fmod(levelThreeTime, 1) * 100
		secondsTime = fmod(levelThreeTime, 60)
		minutesTime = fmod(levelThreeTime, 3600) / 60
		levelLabel.text = "You completed Level 3 in:"
		continueButton.visible = false
		continueSpacer.visible = false
		
	minutes.text = "%02d:" % minutesTime
	seconds.text = "%02d." % secondsTime
	msec.text = "%03d" % msecTime
func _on_continue_pressed():
	if Global.currentLevel == 1:
		get_tree().change_scene_to_file("res://Scenes/Levels/LevelTwo.tscn")
		Global.currentLevel += 1
	elif Global.currentLevel == 2:
		get_tree().change_scene_to_file("res://Scenes/Levels/LevelThree.tscn")
		Global.currentLevel += 1
func _on_quit_pressed():
	get_tree().quit()

func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menus/StartMenu.tscn")

func _on_replay_pressed():
	if Global.currentLevel == 1:
		get_tree().change_scene_to_file("res://Scenes/Levels/LevelOne.tscn")
	elif Global.currentLevel == 2:
		get_tree().change_scene_to_file("res://Scenes/Levels/LevelTwo.tscn")
	elif Global.currentLevel == 3:
		get_tree().change_scene_to_file("res://Scenes/Levels/LevelThree.tscn")
