extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var population = 100

#WHEAT, CLAY, WOOD, STONE, IRON
var resources = [100,100,100,100,0]
var maxResources = [1000,1000,1000,1000,1000]
var perDay = [0,0,0,0,0]

#60 seconds = 1 day
var perSecond = 1/60.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _process(delta):
	perDay = [0,0,0,0,0]
	
	#Production from resource tiles
	for item in $Resources.tiles:
		var production = item.productionPerWorkerPerLevel[item.level] * item.workers * delta * perSecond;
		#(perSecond)
		
		var resId;
		#Wheat
		if(item.type == 1):
			resId = 0
		#Clay
		if(item.type == 2):
			resId = 1
		#Wood
		if(item.type == 3):
			resId = 2
		#Stone
		if(item.type == 4):
			resId = 3
		
		resources[resId]+= production
		if(resources[resId] > maxResources[resId]):
			resources[resId] = maxResources[resId]
		perDay[resId]+= item.productionPerWorkerPerLevel[item.level] * item.workers
	
	#Food consumption from population
	var popConsumption= population * 0.5 * delta * perSecond	
	#Food consumption from army (TODO)
	
	var totalConsumption = popConsumption
	resources[0]-= totalConsumption
	
	#Updating resource UI
	var resourseText = ["Wheat: ", "Clay: ", "Wood: ", "Stone: ", "Iron: "]
	var i = 0
	for item in resourseText:
		#print(item)
		var text = resourseText[i] + str(floor(resources[i])) + "/" + str(maxResources[i])
		$CanvasLayer/ResourceCoutnerUI/ItemList.set_item_text(i, text)
		i+=1 
		
	#print(resources)
	#print(perDay)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ButtonResources_pressed():
	print("Pressed")
	$Center.hide()
	$Resources.show()


func _on_ButtonCenter_pressed():
	print("Pressed")
	$Resources.hide()
	$Center.show()
