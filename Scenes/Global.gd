extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export(int) var score = 0
export(int) var health = 100

export(Array, String) var quotes

# Called when the node enters the scene tree for the first time.
func _ready():
	quotes = [
		"nutbusters",
		"how can mirrors be real if our eyes are not real",
		""
	]
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
