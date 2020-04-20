extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export(Array, PackedScene) var enemies
var original_position = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	original_position = Vector2(position)
	randomize()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	position = original_position + Vector2(0,Global.score/20)

func _on_SpawnTimer_timeout():
	var pos = Vector2()
	pos.x = (randi() % int($CollisionShape2D.shape.extents.x*2))
	pos.y = (randi() % int($CollisionShape2D.shape.extents.y*2))
	var enemy = enemies[randi() % enemies.size()].instance()
	enemy.global_position = pos + transform.get_origin() - $CollisionShape2D.shape.extents
	enemy.set_as_toplevel(true)
	add_child(enemy)

	$SpawnTimer.wait_time = clamp(5.0 - float(Global.score/400.0), 0.5, 5)


