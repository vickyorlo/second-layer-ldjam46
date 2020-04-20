extends KinematicBody2D
class_name bounceoff_barrier

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var original_position = Vector2()


# Called when the node enters the scene tree for the first time.
func _ready():
	original_position = Vector2(position)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	position = original_position + Vector2(0,Global.score/20)

func _on_bounceoff_body_entered(body):
	if body.is_class("ball"):
		body.bounceoff()
