extends Popup


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var already_paused
var selected_menu


# Called when the node enters the scene tree for the first time.
func change_menu_color():
	$resume.color = Color.blanchedalmond
	$restart.color = Color.wheat
	$quit.color = Color.bisque

	match selected_menu:
		0:
			$resume.color = Color.peru
		1:
			$restart.color = Color.azure
		2:
			$quit.color = Color.chartreuse

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print("a")
	if not visible:
		if Input.is_action_just_pressed("menu"):
			# Pause game
			already_paused = get_tree().paused
			get_tree().paused = true
			# Reset the popup
			selected_menu = 0
			change_menu_color()
			# Show popup
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
					hide()
				1:
					# Restart game
					Global.score = 0
					Global.health = 100
					get_tree().change_scene("res://Scenes/level.tscn")
					get_tree().paused = false
				2:
					# Quit game
					get_tree().quit()
	pass
