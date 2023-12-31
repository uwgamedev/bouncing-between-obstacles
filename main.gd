extends Node2D

var score := 0:
	set (value):
		score = value
		$ScoreLabel.text = str(score)


func _ready():
	get_tree().paused = true
	%StartButton.grab_focus()


func game_over():
	get_tree().paused = true
	$GameOverScreen.show()
	$LoseSound.play()
	$BackgroundMusicGame.playing = false
	$BackgroundMusicEnd.playing = true
	%RetryButton.grab_focus()


func _on_player_obstacle_hit():
	game_over()


func _on_player_score_hit():
	score += 1
	$ScoreSound.play()
	if score % 10 == 0:
		$Confetti.emitting = true


func _on_retry_button_pressed():
	get_tree().reload_current_scene()
	get_tree().paused = false


func _on_start_button_pressed():
	get_tree().paused = false
	$GameStartScreen.hide()
	$StartSound.play()
