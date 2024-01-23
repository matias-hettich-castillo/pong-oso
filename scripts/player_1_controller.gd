extends CharacterBody2D

var speed = 2
var starting_position = position
	
func get_input():
	var input_direction = Input.get_vector("player_1_left", "player_1_right", "player_1_up", "player_1_down")
	velocity = Vector2(0,1) * input_direction * speed
	
func _physics_process(_delta):
	position.x = starting_position.x
	get_input()
	move_and_collide(velocity)

# Restart the player 1 position in case there's a goal
func _on_ball_reset_players():
	position = starting_position
