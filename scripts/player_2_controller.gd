extends CharacterBody2D

@export var speed = 75
var starting_position = Vector2()

func _ready():
	starting_position = position

func get_input():
	var input_direction = Input.get_vector("ui_home", "ui_end", "ui_page_up", "ui_page_down")
	velocity = Vector2(0,1) * input_direction * speed
	
func _physics_process(_delta):
	position.x = starting_position.x
	get_input()
	move_and_slide()
