extends CharacterBody2D

signal player_1_goal
signal player_2_goal

var starting_position = Vector2()

func _ready():
	starting_position = position
	velocity = Vector2(1, 1)

func _physics_process(_delta):
	var collision = move_and_collide(velocity)
	if collision:
		# print(collision.get_angle())
		# if collision.get_angle() 0.7 "abajo", 1.5 "derecha", 3.14 "arriba"
		
		# Collision with upper or lower walls
		if collision.get_angle() < 1.5 or collision.get_angle() > 3.1:
			velocity *= Vector2(1, -1)
		
		# Collision with left or right paddles
		if collision.get_angle() > 1.5 and collision.get_angle() < 3.1:
			velocity *= Vector2(-1, 1)

func reset_ball():
	position = starting_position
	velocity *= Vector2(-1, -1)

func _on_player_1_goal_body_entered(_body):
	emit_signal("player_1_goal")
	reset_ball()

func _on_player_2_goal_body_entered(_body):
	emit_signal("player_2_goal")
	reset_ball()
