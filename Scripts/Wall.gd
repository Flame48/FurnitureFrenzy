extends TileMap

var pushPower = 500
const tileSize = 16
var inputCooldown = 0
var inputTime = 1

var targetX = position.x;
var targetY = position.y;
var prevX = position.x
var prevY = position.y

@onready var tile_map = $"../Floor"
@onready var screenSize = get_viewport().get_visible_rect().size

func _physics_process(delta):
	if inputCooldown>0:
		inputCooldown = inputCooldown - 8*delta
	else:
		handleInputs()
	if inputCooldown<=0:
		position.x = tile_map.map_to_local(tile_map.local_to_map(global_position)).x
		position.y = tile_map.map_to_local(tile_map.local_to_map(global_position)).y
		prevX = position.x
		prevY = position.y
	var lerpWeight = smoothstep(0,1, 1-(inputCooldown/inputTime))
	position.x = lerp(prevX, targetX, lerpWeight)
	position.y = lerp(prevY, targetY, lerpWeight)
	updateFurnitureInterpolation()

func updateFrame(targetDirection):
	targetY = position.y + targetDirection.y*tileSize
	targetX = position.x + targetDirection.x*tileSize
	prevX = position.x
	prevY = position.y
	inputCooldown = inputTime
	pushFurniture(targetDirection.x, targetDirection.y)
	

func checkIfCanMove(inputDirectionX, inputDirectionY):
	for _i in get_node("../ImmovableWall").get_children():
		if !_i.canMove(Vector2(inputDirectionX, inputDirectionY)):
			return false
	return true

func pushFurniture(directionX, directionY):
	for _i in get_node("../Furniture").get_children():
		_i.move(Vector2(directionX, directionY))

func updateFurnitureInterpolation():
	for _i in get_node("../Furniture").get_children():
		_i.updateInterpolation(inputCooldown, inputTime)

func handleInputs():
	if Input.is_action_pressed("WallUp") && checkIfCanMove(0,-1):
		updateFrame(Vector2(0,-1))
	elif Input.is_action_pressed("WallDown") && checkIfCanMove(0,1):
		updateFrame(Vector2(0, 1))
	elif Input.is_action_pressed("WallRight") && checkIfCanMove(1, 0):
		updateFrame(Vector2(1, 0))
	elif Input.is_action_pressed("WallLeft") && checkIfCanMove(-1, 0):
		updateFrame(Vector2(-1,0))
