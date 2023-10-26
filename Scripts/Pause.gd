extends Node2D

@onready var pause_menu = $Camera2D/PauseMenu
var paused = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Pause"):
		pauseMenu()
	if Input.is_action_just_pressed("Reset"):
		get_tree().reload_current_scene()
		paused = true

func pauseMenu():
	if !paused:
		Engine.time_scale = 1
		pause_menu.hide()
	else:
		Engine.time_scale = 0
		pause_menu.show()
	paused = !paused
