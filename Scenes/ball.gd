extends RigidBody2D
class_name ball


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal died

export var max_speed = 1000.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _integrate_forces(state):
	if state.linear_velocity.length()>max_speed:
		state.linear_velocity = state.linear_velocity.normalized()*max_speed

func bounceoff():
	add_central_force(Vector2.DOWN*100)
	pass

func death():
	queue_free()
	emit_signal("died")
	pass
