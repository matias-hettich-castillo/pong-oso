extends CharacterBody2D

signal player_1_goal_entered
signal player_2_goal_entered

# Soundfx for ball bounce
@onready var ball_bounce_wall = $ball_bounce_wall
@onready var ball_bounce_player = $ball_bounce_player

var starting_position = position

func _ready():
	velocity = Vector2(1,1)
	reset_ball()
	
func _physics_process(_delta):
	# Manages the ball movement
	var collision = move_and_collide(velocity)
	
	# Switches the direction of the ball depending if there was a
	# collision with an horizontal or vertical wall
	if collision:
		# Check if collision with wall or player
		if str(collision.get_collider()).contains("boundaries"):
			# Play bounce wall sfx
			ball_bounce_wall.play()
		else:
			# Play bounce player sfx
			ball_bounce_player.play()
		
		# Check collision with horizontal side of a collision shape
		if collision.get_normal() in [Vector2(0,1), Vector2(0,-1)]:
			velocity *= Vector2(1,-1)
		# Collision with vertical side of a collision
		else:
			velocity *= Vector2(-1,1)

# Function that reset the parameters of the ball
func reset_ball():
	# Switch previous direction
	velocity *= Vector2(-1, -1)
	
	# Reset position
	position = starting_position

# When the ball enters the goal of player 1
func _on_player_1_goal_body_entered(_body):
	emit_signal("player_1_goal_entered")
	reset_ball()

# When the ball enters the goal of player 2
func _on_player_2_goal_body_entered(_body):
	emit_signal("player_2_goal_entered")
	reset_ball()
