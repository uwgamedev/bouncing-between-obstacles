extends Area2D

signal obstacle_hit
signal score_hit

var velocity := -700.0  # start with a bounce

func _physics_process(delta: float):
	velocity += 1300.0 * delta  # gravitational acceleration
	position.y += velocity * delta  # moving the player
	
	if Input.is_action_just_pressed("bounce"):
		velocity = -700.0


func _on_area_entered(area: Area2D):
	if area.is_in_group(&"obstacles"):
		print('obstacle')
		emit_signal("obstacle_hit")
	
	if area.is_in_group(&"scores"):
		print('score')
		emit_signal("score_hit")

