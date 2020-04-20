extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export(int) var score = 0
export(float) var health = 100.0
export(float) var heatlh_drain = 0

export(float) var enemy_speed = 100

signal die

export(Array, String) var quotes

# Called when the node enters the scene tree for the first time.
func _ready():
	quotes = [
		"The water that supports the jet ski is the same that engulfs it",
		"Doubt the authentity of mirros, as means of gazing is false",
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
		"It is safe to turn off your computer",
		"Yawns exchange mouths like squirrels do trees",
		"When an eye is being tightened, another will pour water",
		"This game is nothing but a metaphor to the struggle between man and his own divinity",
		"To personally know a tree, locate it's fruits",
		"One's greatest obstacles are slipping pants and horse that tells the time wrong",
		"It is insanity to blow into a flute, madness to exhale into a lock",
		"The wind from eastwards is the meanest, for it steals fish from pots",
		"Time moves slowly if you can see vicar row a boat with cantor at helm",
		"Who first enters a burlap sack is the last one to come out",
		"Using butter to oil your gloves prevents seeing flowers in skies",
		"For if egg fails to stand up, rest of the world won't either",
		"Cabbage raises the children, but porridge hands them blades",
		"Coffee is good in the morning and during rest of the day",
		"First is a time among other measures of it",
		"Fox is relative to a dog, and crows belong in same tribe as eagles",
		"Circle around the stone, do not curse it",
		"Is it not the cat itself that raises it's tail",
		"The volume of chefs around singular soup contributes to decline of quality in direct relation",
		"You can understand coughing, without having the symptoms yourself",
		"Everyone knows monkey, despite the monkey not knowing anyone",
		"Time will come once the cheese is consumed",
		"With enough time and effort, even the sun can be obtained from the sky",
		"Frog is delicious, if consumed without knowledge",
		"A sausage has two end, one of them is at the end of it",
		"During thin times, place the bread skewers higher on ceiling",
		"Someone who doesn't remember requires multiple pair of shoes",
		"Question the timing of bringing in hay if the cows have passed",
		"Those who wait can measure time in tall units",
		"A ditch is more explored than the river",
		"Oiled is the stovepot of peace, even when boiling water",
		"Swamp doesn't house a growth enviroment for stones, and neither will piece of cloth for cranberries",
		"Winter keeps it's manners, in the same way a dish holds it's flavour",
		"To build a house, you need to make it",
		"Debt is a brother when taken, nephew when paid",
		"Against all laws of aviations, bees can fly. And so can you",
		"When among the crows, caw as the crows do",
		"Don’t teach a father how to make children",
		"The drowning man clutches at a razor",
		"Don’t divide the skin while it’s still on the bear",
		"Not my circus, not my monkeys",
		"Don’t call the wolf from the forest",
		"The way you make your bed is the way you will sleep in it.",
		"The virtue above all virtues is to keep your tongue behind your teeth.",
		"You do not check the teeth of a horse you were gifted.",
		"A terrible ballerina blames the hem of her skirt.",
		"Do not jump at the sun with a hoe.",
		"And the one who does not drink with us - we will catch him with two sticks.",
		"You can either have the fish, or you can have the aquarium.",
		"Summer would be longer if not for winter.",
		"If a woman wants to, she will put out even through a keyhole.",
	]
	pass # Replace with function body.


func _process(delta):
	if health > 0:
		health -= heatlh_drain * delta
		health = clamp(health,0,100)
		if health == 0:
			heavy_gravity()
	else:
		score -= 10 * delta
	enemy_speed = 100 + score/100

func heavy_gravity():
	Physics2DServer.area_set_param(get_world_2d().get_space(), Physics2DServer.AREA_PARAM_GRAVITY, 200)

func normal_gravity():
	Physics2DServer.area_set_param(get_world_2d().get_space(), Physics2DServer.AREA_PARAM_GRAVITY, 98)

func gameover():
	emit_signal("die")
