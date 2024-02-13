extends CharacterBody2D

var speed = 0.75
var starting_position = position

# Registers the player 1 input buttons
func get_input():
	var input_direction = Input.get_vector("player_1_left", "player_1_right", "player_1_up", "player_1_down")
	velocity = Vector2(0,1) * input_direction * speed

# Manages the player 1 movement
func _physics_process(_delta):
	# Fixes the horizontal position of the bar
	position.x = starting_position.x
	
	# Get the player 1 input and apply to movement
	get_input()
	move_and_collide(velocity)

# Restart the player 1 position in case there's a goal
func _on_ball_reset_players():
	position = starting_position
