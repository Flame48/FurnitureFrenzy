extends Control

@onready var level  = $"../.."
@onready var buttonClick = $ButtonClick

func _on_resume_pressed():
	buttonClick.play()
	await buttonClick.finished
	level.pauseMenu()

func _on_main_menu_pressed():
	buttonClick.play()
	await buttonClick.finished
	get_tree().change_scene_to_file("res://Scenes/Menus/StartMenu.tscn")
	Global.playLevelMusic = false
	Global.playMenuMusic = true

func _on_quit_pressed():
	buttonClick.play()
	await buttonClick.finished
	get_tree().quit()
	
func _on_reset_pressed():
	buttonClick.play()
	await buttonClick.finished
	get_tree().reload_current_scene()
	Engine.time_scale = 1
