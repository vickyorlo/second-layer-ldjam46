extends RigidBody2D
class_name ball


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var max_speed = 1000.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.health == 0:
		if !$AudioStreamPlayer2D.playing:
			$AudioStreamPlayer2D.play()
	else:
		$AudioStreamPlayer2D.stop()
	pass

func _integrate_forces(state):
	if state.linear_velocity.length()>max_speed:
		state.linear_velocity = state.linear_velocity.normalized()*max_speed

func bounceoff():
	add_central_force(Vector2.DOWN*100)
	pass

func death():
	queue_free()
	Global.gameover()


func _on_RigidBody2D_body_entered(body):
	if body is paddle:
		if !$slap_city_player.playing:
			$slap_city_player.play()
		else:
			$slap_city_player.stop()
		if Global.health == 0:
			Global.normal_gravity()
		Global.health += 15
		Global.score += 10
	if body is bounceoff_barrier:
		Global.score += 50
