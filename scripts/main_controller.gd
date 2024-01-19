extends Node2D

signal update_player_1_score(value)
signal update_player_2_score(value)

var player_1_score = 0
var player_2_score = 0

func _on_button_quit_button_down():
	get_tree().quit()

func _on_ball_player_1_goal():
	player_2_score += 1
	emit_signal("update_player_2_score", player_2_score)

func _on_ball_player_2_goal():
	player_1_score += 1
	emit_signal("update_player_1_score", player_1_score)
