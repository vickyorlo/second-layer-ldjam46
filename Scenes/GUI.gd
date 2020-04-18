extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.connect("die", self, "_on_died")
	pass # Replace with function body.



func _process(delta):
	$HealthBar.value = Global.health
	$score_number.text = "%06d" % Global.score
	pass


func _on_died():
	$CenterContainer/TextureRect.visible = true
	pass # Replace with function body.
