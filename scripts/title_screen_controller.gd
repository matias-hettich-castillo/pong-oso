extends Node2D

signal option_switch

# Music and soundfx
@onready var title_screen_music = $title_screen_music
@onready var select_soundfx = $select_soundfx
@onready var start_soundfx = $start_soundfx

# Title screen game options
enum OPTIONS {
	P1_VS_COM,
	P1_VS_P2
}
var current_option = OPTIONS.P1_VS_COM

func _ready():
	title_screen_music.play()

func _input(event):
	# Cycle between game options
	if event.is_action_released("player_1_select"):
		# Play select soundfx
		select_soundfx.play()
		
		# Switch selected game option
		if current_option == OPTIONS.P1_VS_COM:
			current_option = OPTIONS.P1_VS_P2
		else:
			current_option = OPTIONS.P1_VS_COM
		
		emit_signal("option_switch", current_option)
	
	# Start the game selected
	if event.is_action_released("player_1_start"):
		# Play start game soundfx
		start_soundfx.play()
		
		# Wait for the sound to play
		while start_soundfx.playing:
			pass
		
		# Start a new P1 vs P2 game
		if current_option == OPTIONS.P1_VS_P2:
			get_tree().change_scene_to_file("res://main.tscn")
