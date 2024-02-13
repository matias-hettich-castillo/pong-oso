extends Node2D

signal option_switch

# Music and soundfx
@onready var title_screen_music = $title_screen_music
@onready var select_soundfx = $select_soundfx
@onready var start_soundfx = $start_soundfx

# Title screen game options
var current_option = global.OPTIONS.P1_VS_COM

func _ready():
	current_option = global.OPTIONS.P1_VS_COM
	title_screen_music.play()

func _input(event):
	# Cycle between game options
	if event.is_action_released("player_1_select"):
		# Play select soundfx
		select_soundfx.play()
		
		# Switch selected game option
		if current_option == global.OPTIONS.P1_VS_COM:
			current_option = global.OPTIONS.P1_VS_P2
		else:
			current_option = global.OPTIONS.P1_VS_COM
		
		emit_signal("option_switch", current_option)
	
	# Start the game selected
	if event.is_action_released("player_1_start"):
		# Save to global variable
		global.current_option = current_option
		
		# Play start game soundfx
		start_soundfx.play()
		
		# Wait for the sound to play
		while start_soundfx.playing:
			pass
		
		# Start a new game
		get_tree().change_scene_to_file("res://main.tscn")
		
