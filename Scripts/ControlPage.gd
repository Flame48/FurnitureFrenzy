extends Control
@onready var buttonClick = $ButtonClick

func _on_back_pressed():
	buttonClick.play()
	await buttonClick.finished
	get_tree().change_scene_to_file("res://Scenes/Menus/StartMenu.tscn")
