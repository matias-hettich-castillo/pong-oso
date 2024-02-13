extends CharacterBody2D

var speed = 0.75
var starting_position = position

# Registers the player 2 input buttons
func get_input():
	var input_direction = Input.get_vector("player_2_left", "player_2_right", "player_2_up", "player_2_down")
	velocity = Vector2(0,1) * input_direction * speed

# Manages the player 2 movement
func _physics_process(_delta):
	# fixes the player 2 horizontal position
	position.x = starting_position.x
	
	# Get the player 2 input anb apply movement
	get_input()
	move_and_collide(velocity)

# Restart the player 2 position in case there's a goal
func _on_ball_reset_players():
	position = starting_position
