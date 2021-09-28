extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var resourceNodeScript = load("res://ResourceNode.gd")
var levelMarker = load("res://LevelMarker.tscn")

var VillageCoordinates = Vector2(0,0)

var dialogOpen = false

var ResourceCoordinates = [
	Vector2(-1,-2),
	Vector2(0,-2),
	Vector2(1,-2),
	Vector2(-2,-1),
	Vector2(-1,-1),
	Vector2(0,-1),
	Vector2(1,-1),
	Vector2(-2,0),
	Vector2(-1,0),
	Vector2(1,0),
	Vector2(2,0),
	Vector2(-2,1),
	Vector2(-1,1),
	Vector2(0,1),
	Vector2(1,1),
	Vector2(-1,2),
	Vector2(0,2),
	Vector2(1,2)
]

var TileDict = {}

var tiles = []

var TilesToGenerate = [1,1,1,1,1,1, 2,2,2,2, 3,3,3,3, 4,4,4,4]

# Called when the node enters the scene tree for the first time.
func _ready():
	var shuffeledList = shuffleList(TilesToGenerate)
	
	#Set center tile to village tile
	$ResourceTileMap.set_cell(0, 0, 0)
	
	#Create other tiles
	var i = 0
	print(shuffeledList)
	for item in shuffeledList:
		var instance = resourceNodeScript.new(item)
		#instance.init(item)

		var coordinates = ResourceCoordinates[i]
		tiles.append(instance)
		TileDict[coordinates] = instance
		$ResourceTileMap.set_cell(coordinates.x, coordinates.y, item)
		i = i+1
		
		var LMinstance = levelMarker.instance()
		LMinstance.init(instance)
		#LMinstance.set_scale(0.5,0.5)
		var realCords = $ResourceTileMap.map_to_world(coordinates)
		var tileSize = $ResourceTileMap.tile_set.tile_get_texture(0).get_size().y
		realCords = realCords + Vector2(tileSize/2 - 15, tileSize/2)
		LMinstance.set_position(realCords)
		$ResourceLevelsUI.add_child(LMinstance)

func _unhandled_input(event):
	if !is_visible():
		return
	if event.is_action_released("leftclick"):
		var Cell = $ResourceTileMap.FindCell(get_global_mouse_position())
		print(Cell)
		var world = $ResourceTileMap.map_to_world(Cell)
		
		if(TileDict.has(Cell)):
			print("Tile found!")
			var tile = TileDict.get(Cell)
			dialogOpen = true
			$CanvasLayer/TileUI.show()
			$CanvasLayer/TileUI.setTile(tile)
			#TODO: Pass tile to dialog
		else:
			if(dialogOpen == true):
				$CanvasLayer/TileUI.hide()
				dialogOpen = false
		
func shuffleList(list):
	randomize()
	var shuffledList = [] 
	var indexList = range(list.size())
	for i in range(list.size()):
		var x = randi()%indexList.size()
		shuffledList.append(list[indexList[x]])
		indexList.remove(x)
	return shuffledList

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
