extends Marker2D

var obstacle = preload("res://objects/obstacle/obstacle.tscn")

func _ready():
	add_obstacle(2.5)
	add_obstacle(5.0)
#	add_obstacle(7.5)

func add_obstacle(offset=0.0):
	var new_obstacle := obstacle.instantiate()
	add_child(new_obstacle)
	new_obstacle.get_node("AnimationPlayer").advance(offset)
	new_obstacle.position.y += randf_range(-250, 250)
