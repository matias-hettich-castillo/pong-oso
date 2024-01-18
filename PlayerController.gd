extends CharacterBody2D

@export var speed = 75

func get_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = Vector2(0,1) * input_direction * speed
	
func _physics_process(_delta):
	get_input()
	move_and_slide()
