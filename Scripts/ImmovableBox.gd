extends RayCast2D


# Called when the node enters the scene tree for the first time.
func _ready():
	target_position = Vector2.DOWN*16

func canMove(direction):
	if direction.length()>0:
		if direction.y > 0: target_position = Vector2.UP*16
		if direction.y < 0: target_position = Vector2.DOWN*16
		if direction.x > 0: target_position = Vector2.LEFT*16
		if direction.x < 0: target_position = Vector2.RIGHT*16
		force_raycast_update()
		
		if is_colliding():
			var collider = get_collider()
			if collider.get_class() == "TileMap":
				return false
			if collider.get_class() == "Area2D":
				return !collider.get_node("../").checkDirection(-1*direction)
			return true
	return true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
