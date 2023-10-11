extends Node2D

var score := 0:
	set (value):
		score = value
		$ScoreLabel.text = str(score)


func _ready():
	get_tree().paused = true


func game_over():
	get_tree().paused = true
	$GameOverScreen.show()


func _on_player_obstacle_hit():
	print('po?')
	game_over()


func _on_player_score_hit():
	score += 1


func _on_retry_button_pressed():
	get_tree().reload_current_scene()
	get_tree().paused = false


func _on_start_button_pressed():
	get_tree().paused = false
	$GameStartScreen.hide()
