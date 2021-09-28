extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var resourceNode;

# Called when the node enters the scene tree for the first time.
func _ready():
	resourceNode = null

func setTile(_tile):
	resourceNode = _tile

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
