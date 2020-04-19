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
		"Doubt the authentity of mirros, as  means of gazing is false",
		"At the start of the month bread rises, at the end of the month the laundry is gone",
		"Let the horse worry, for it has the larger head",
		"There are many bends on a matter, but a stick has two ends",
		"You do not use grandmother as transportation to church",
		"A grasshopper does not perish underneath a spider",
		"Man piloting a plough does not feel a fly in his stomach",
		"To forge a spoon fitting everyone's mouth diameters would be huge inconvenience",
		"The only free things you can obtain are ferrets from a pile and squirrel from a tree",
		"Maid is not a human, as a magpie is not a bird",
		"You don't hang money from the neck",
		"Do not lay down into a fire and stay there",
		"Extra barriers do not flip over the boat",
		"The early spring frost rests on the shoulders of a goose, and the winter is located behind a swan",
		"Strongest things in the world is an oar, bundle of sticks and a pole",
		"When running out of bread, place teeth onto a nail",
		"Chikens rarely recycle eggs",
		"Yawns exchange mouths like squirrels do trees",
		"When an eye is being tightened, another will pour water",
		"To personally know a tree, locate it's fruits",
		"One's greatest obstacles are slipping pants and horse that tells the time wrong",
		"It is insanity to blow into a flute, madness to exhale into a lock",
		"",
	]
	pass # Replace with function body.


func _process(delta):
	health -= 10 * delta
	pass

func gameover():
	emit_signal("die")
