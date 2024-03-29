extends Node2D

signal update_player_1_score(value)
signal update_player_2_score(value)

var player_1_score = 0
var player_2_score = 0

func _input(event):
	# Reset game to title screen
	if event.is_action_released("game_exit"):
		get_tree().change_scene_to_file("res://title_screen.tscn")

# Registers if Player 2 has scored a goal
func _on_ball_player_1_goal_entered():
	player_2_score += 1
	emit_signal("update_player_2_score", player_2_score)

# Registers if Player 1 has scored a goal
func _on_ball_player_2_goal_entered():
	player_1_score += 1
	emit_signal("update_player_1_score", player_1_score)
