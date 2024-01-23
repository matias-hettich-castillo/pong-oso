extends CharacterBody2D

signal player_1_goal_entered
signal player_2_goal_entered
signal reset_players

var starting_position = position

func _ready():
	velocity = Vector2(1,1)
	reset_ball()
	
func _physics_process(_delta):
	var collision = move_and_collide(velocity)
	if collision:
		# Check collision with horizontal side of a collision shape
		if collision.get_normal() in [Vector2(0,1), Vector2(0,-1)]:
			velocity *= Vector2(1,-1)
		# Collision with vertical side of a collision
		else:
			velocity *= Vector2(-1,1)

func reset_ball():
	velocity *= Vector2(-1, -1)
	position = starting_position
	emit_signal("reset_players")

# When the ball enters the goal of player 1
func _on_player_1_goal_body_entered(_body):
	emit_signal("player_1_goal_entered")
	reset_ball()

func _on_player_2_goal_body_entered(_body):
	emit_signal("player_2_goal_entered")
	reset_ball()
