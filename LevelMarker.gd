extends Control

class_name LevelMarker
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func init(var _resourceNode):
	#var text = _resourceNode.level
	#$CenterContainer/Label.text = text
	#var text = _resourceNode.level
	#print(_resourceNode.level)
	$Label.set_text(str(_resourceNode.level))
	pass

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
