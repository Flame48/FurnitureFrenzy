extends Control

@onready var level  = $"../.."

func _on_resume_pressed():
	level.pauseMenu()

func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menus/StartMenu.tscn")

func _on_quit_pressed():
	get_tree().quit()
	
func _on_reset_pressed():
	get_tree().reload_current_scene()
	Engine.time_scale = 1
