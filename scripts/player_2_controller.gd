extends CharacterBody2D

var speed = 0.75
var starting_position = position

@onready var ball = $"../ball"

# Registers the player 2 input buttons
func get_input():
	var input_direction = Vector2(0, 0)
	
	if global.current_option == global.OPTIONS.P1_VS_P2:
		# Execute this if P1 vs P2
		input_direction = Input.get_vector("player_2_left", "player_2_right", "player_2_up", "player_2_down")
		velocity = Vector2(0,1) * input_direction * speed
	else:
		# Execute this if P1 vs COM
		if ball.velocity.x > 0 and ball.position.x > get_viewport_rect().size.x/2:
			if ball.position.y > position.y:
				input_direction = Vector2(0, 1)
			if ball.position.y < position.y:
				input_direction = Vector2(0, -1)
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
