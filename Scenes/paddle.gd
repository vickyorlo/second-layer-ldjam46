extends KinematicBody2D
class_name paddle


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export (int) var speed = 200

var velocity = Vector2()

func get_input():
	look_at(get_global_mouse_position())
	velocity = Vector2()
	if Input.is_action_pressed('down'):
		velocity.y = speed
	if Input.is_action_pressed('up'):
		velocity.y = -speed
	if Input.is_action_pressed('left'):
		velocity.x = -speed
	if Input.is_action_pressed('right'):
		velocity.x = +speed

func _physics_process(delta):
	get_input()
	move_and_slide(velocity)

func death():
	Global.gameover()
	queue_free()
