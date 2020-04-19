extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var paddle = get_node("res://Scenes/paddle.gd")
var already_paused
var selected_menu
var visible

# Called when the node enters the scene tree for the first time.
func change_menu_color():
	$resume.color = Color.gray
	$restart.color = Color.gray
	$quit.color = Color.gray
	
	match selected_menu:
		0:
			$resume.color = Color.yellow
		1:
			$restart.color = Color.blue
		2:
			$quit.color = Color.green
func _input(event):
	if not visible:
		if Input.is_action_just_pressed("menu"):
			# Pause game
			already_paused = get_tree().paused
			get_tree().paused = true
			# Reset the popup
			selected_menu = 0
			change_menu_color()
			# Show popup
			paddle.set_process_input(false)
			popup()
	else:
		if Input.is_action_just_pressed("ui_down"):
			selected_menu = (selected_menu + 1) % 3;
			change_menu_color()
		elif Input.is_action_just_pressed("ui_up"):
			if selected_menu > 0:
				selected_menu = selected_menu - 1
			else:
				selected_menu = 2
			change_menu_color()
		elif Input.is_action_just_pressed("ui_accept"):
			match selected_menu:
				0:
					# Resume game
					if not already_paused:
						get_tree().paused = false
					player.set_process_input(true)
					hide()
				1:
					# Restart game
					get_tree().change_scene("res://Scenes/level.tscn")
					get_tree().paused = false
				2:
					# Quit game
					get_tree().quit()
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
