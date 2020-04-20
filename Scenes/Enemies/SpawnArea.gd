extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export(Array, PackedScene) var enemies

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_SpawnTimer_timeout():
	var pos = Vector2()
	pos.x = (randi() % int($CollisionShape2D.shape.extents.x))
	pos.y = (randi() % int($CollisionShape2D.shape.extents.y))
	var enemy = enemies[randi() % enemies.size()].instance()
	enemy.global_position = pos + transform.get_origin() - $CollisionShape2D.shape.extents/2
	enemy.set_as_toplevel(true)
	add_child(enemy)

	$SpawnTimer.wait_time = clamp(5.0 - Global.score/200,0.5,5)


