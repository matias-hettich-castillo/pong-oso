extends Label

# Soundfx for ball goal
@onready var ball_goal = $ball_goal

func _play_goal_sound():
	ball_goal.play()
	
func _on_ball_player_1_goal_entered():
	_play_goal_sound()
	text = "Player 2 Goal!"

func _on_ball_player_2_goal_entered():
	_play_goal_sound()
	text = "Player 1 Goal!"
