extends Area2D

signal obstacle_hit
signal score_hit

const BOUNCE = -700.0

var velocity := BOUNCE  # start with a bounce

var G = 1300.0

func _physics_process(delta: float):
	velocity += G * delta  # gravitational acceleration
	position.y += velocity * delta  # moving the player
	
	if Input.is_action_just_pressed("bounce"):
		velocity = BOUNCE


func _on_area_entered(area: Area2D):
	if area.is_in_group(&"obstacles"):
		emit_signal("obstacle_hit")
	
	if area.is_in_group(&"scores"):
		emit_signal("score_hit")

