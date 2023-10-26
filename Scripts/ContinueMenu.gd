extends Control

@onready var msec = $Camera2D/MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/msec
@onready var minutes = $Camera2D/MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/minutes
@onready var seconds = $Camera2D/MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/seconds
@onready var levelLabel = $Camera2D/MarginContainer/HBoxContainer/VBoxContainer/TimeText
@onready var continueSpacer = $Camera2D/MarginContainer/HBoxContainer/VBoxContainer/Label2
@onready var continueButton = $Camera2D/MarginContainer/HBoxContainer/VBoxContainer/Continue
@onready var timeLabel = %TimeText
@onready var timeLabelSpacer = %Label3
@onready var timeBox = %HBoxContainer
@onready var timeBoxSpacer = %Spacer
@onready var thankYou = %ThankYou
@onready var thankYouSpacer = %Label5

var msecTime = 0
var minutesTime = 0
var secondsTime = 0
func _ready():
	thankYou.visible = false
	thankYouSpacer.visible = false
	msecTime = fmod(Global.levelTime, 1) * 100
	secondsTime = fmod(Global.levelTime, 60)
	minutesTime = fmod(Global.levelTime, 3600) / 60
	levelLabel.text = "You completed Level " + str(Global.currentLevel) + " in:"
	if Global.currentLevel == 0:
		timeLabel.visible = false
		timeLabelSpacer.visible = false
		timeBox.visible = false
		timeBoxSpacer.visible = false
	if Global.currentLevel == 5: #Last Level
		continueButton.visible = false
		continueSpacer.visible = false
		thankYou.visible = true
		thankYouSpacer.visible = true
		
		
	minutes.text = "%02d:" % minutesTime
	seconds.text = "%02d." % secondsTime
	msec.text = "%03d" % msecTime
func _on_continue_pressed():
	Global.currentLevel += 1
	get_tree().change_scene_to_file("res://Scenes/Levels/Level"+str(Global.currentLevel)+".tscn")
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
