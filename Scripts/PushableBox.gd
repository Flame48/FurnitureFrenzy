extends Sprite2D

var targetX = position.x
var targetY = position.y
var prevX = position.x
var prevY = position.y
@onready var tile_map = get_tree().get_root().get_node("TestLevel/Floor")
@onready var winOne = get_tree().get_root().get_node("TestLevel/Furniture/WinOne")
@onready var winTwo = get_tree().get_root().get_node("TestLevel/Furniture/WinTwo")

var time = 0
var winOnce = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	winOnce = 0
	Global.playWinSound = false
	$RayCast2D.target_position = Vector2.DOWN*16
	ResourceLoader.load_threaded_request("res://Scenes/Menus/ContinueMenu.tscn")
	
func _process(delta):
	time += delta
func checkDirection(direction: Vector2):
	$RayCast2D.target_position = direction*16
	$RayCast2D.force_raycast_update()
	
	if $RayCast2D.is_colliding():
		var collider = $RayCast2D.get_collider()
		if(collider.get_class() == "TileMap"):
			return true
		if(collider.get_class() == "Area2D"):
			return collider.get_node("../").checkDirection(direction)
	return false
func move(direction: Vector2)->void:
	if direction.length()>0:
		var movement = Vector2.DOWN
		if direction.y > 0: movement = Vector2.UP
		elif direction.y < 0: movement = Vector2.DOWN
		elif direction.x > 0: movement = Vector2.LEFT
		elif direction.x < 0: movement = Vector2.RIGHT
		
		$RayCast2D.target_position = movement*16
		$RayCast2D.force_raycast_update()
		
		if checkDirection(movement):
			targetX = position.x-movement.x*16
			targetY = position.y-movement.y*16
			prevX = position.x
			prevY = position.y
		else:
			targetX = position.x
			targetY = position.y
	else:
		targetX = position.x
		targetY = position.y

func updateInterpolation(inputCooldown, inputTime):
	if(inputCooldown<=0):
		position.x = tile_map.map_to_local(tile_map.local_to_map(global_position)).x
		position.y = tile_map.map_to_local(tile_map.local_to_map(global_position)).y
		prevX = position.x
		prevY = position.y
		checkIfBoxesAreNear()
		return
	var lerpWeight = smoothstep(0,1, 1-(inputCooldown/inputTime))
	position.x = lerp(prevX, targetX, lerpWeight)
	position.y = lerp(prevY, targetY, lerpWeight)
	


var nearbyBoxes = [] # To store nearby boxes
	
func checkIfBoxesAreNear():
	if winOne.nearbyBoxes.has(winTwo) and isAdjacent():
		Global.playWinSound = true
		Global.levelTime = time
		get_tree().change_scene_to_file("res://Scenes/Menus/ContinueMenu.tscn")
		Global.playLevelMusic = false
		Global.playMenuMusic = true
	else:
		return

func _on_area_2d_area_entered(area):
	if area.has_method("get_name"):
		nearbyBoxes.append(area.get_parent())

func _on_area_2d_area_exited(area):
	if area.has_method("get_name"):
		nearbyBoxes.erase(area.get_parent())

func isAdjacent():
	var win_one_position = winOne.global_transform.origin
	var win_two_position = winTwo.global_transform.origin

	# Convert global positions to tilemap coordinates
	var win_one_tile = tile_map.local_to_map(win_one_position)
	var win_two_tile = tile_map.local_to_map(win_two_position)
	# Check if the boxes are adjacent in tilemap coordinates
	if abs(win_two_tile.x - win_one_tile.x) == 0 and abs(win_two_tile.y - win_one_tile.y) == 1:
		return true
	elif abs(win_two_tile.y - win_one_tile.y) == 0 and abs(win_two_tile.x - win_one_tile.x) == 1:
		return true
	return false
