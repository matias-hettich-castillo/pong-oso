extends Node2D

signal update_player_1_score(value)
signal update_player_2_score(value)

var player_1_score = 0
var player_2_score = 0

func _input(event):
	if event.is_action_released("game_exit"):
		get_tree().quit()

func _on_ball_player_1_goal_entered():
	player_2_score += 1
	emit_signal("update_player_2_score", player_2_score)

func _on_ball_player_2_goal_entered():
	player_1_score += 1
	emit_signal("update_player_1_score", player_1_score)
