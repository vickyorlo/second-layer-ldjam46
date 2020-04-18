extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export(int) var score = 0
export(float) var health = 100.0
export(float) var heatlh_drain = 5

signal die

export(Array, String) var quotes

# Called when the node enters the scene tree for the first time.
func _ready():
	quotes = [
		"nutbusters",
		"how can mirrors be real if our eyes are not real",
		""
	]
	pass # Replace with function body.


func _process(delta):
	health -= 10 * delta
	pass

func gameover():
	emit_signal("die")
