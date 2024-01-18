extends CharacterBody2D

func _ready():
	velocity = Vector2(1, 1)

func _physics_process(_delta):
	var collision = move_and_collide(velocity)
	if collision:
		# if collision with walls
		velocity *= Vector2(1, -1)
		
		# if collision with paddles
		# velocity += Vector2(-1, 1)
	
