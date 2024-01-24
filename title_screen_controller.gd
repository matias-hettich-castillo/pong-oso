extends Node2D

signal option_switch

enum OPTIONS {
	P1_VS_COM,
	P1_VS_P2
}
var current_option = OPTIONS.P1_VS_COM

func _input(event):
	if event.is_action_released("player_1_up") or event.is_action_released("player_1_down") or event.is_action_released("player_2_up") or event.is_action_released("player_2_down"):
		if current_option == OPTIONS.P1_VS_COM:
			current_option = OPTIONS.P1_VS_P2
		else:
			current_option = OPTIONS.P1_VS_COM
		
		emit_signal("option_switch", current_option)
		
	if event.is_action_released("player_1_start"):
		if current_option == OPTIONS.P1_VS_P2:
			get_tree().change_scene_to_file("res://main.tscn")
