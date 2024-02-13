extends Label

func _ready():
	if global.current_option == global.OPTIONS.P1_VS_P2:
		text = "P2 Score: 0"
	else:
		text = "COM Score: 0"

func _on_main_update_player_2_score(value):
	if global.current_option == global.OPTIONS.P1_VS_P2:
		text = "P2 Score: " + str(value)
	else:
		text = "COM Score: " + str(value)
