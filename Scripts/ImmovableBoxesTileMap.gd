extends TileMap


# Called when the node enters the scene tree for the first time.
func _ready():
	var used_cells = get_used_cells(0)
	var scene = load("res://Scenes/Props/ImmovableBox.tscn")
	for pos in used_cells:
		var instance = scene.instantiate()
		add_child(instance)
		instance.position = map_to_local(pos)
	
	clear()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
