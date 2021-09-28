extends Node

class_name ResourceNode

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var type;

var level = 0;
var maxLevel = 5;
var workers = 1;

var productionPerWorkerPerLevel;
var maxWorkersPerLevel;
var resourcesPerLevel;

func _init(var _type):	
	type = _type;
	level = 0;
	workers = 1; #TODO: Change this to 0 when tile popup UI added
	
	productionPerWorkerPerLevel = [10,12,14,16,18,20,22,24,26,28]
	maxWorkersPerLevel = [10,15,20,25,30,35,40,45,50,55]
	resourcesPerLevel = [
		[10,10,10,10,0],
		[20,20,20,20,0],
		[30,30,30,30,0],
		[40,40,40,40,0],
		[50,50,50,50,0]
	]
	
	#Specific for wheat... (TODO)
	if(type == 1):
		pass
			

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
