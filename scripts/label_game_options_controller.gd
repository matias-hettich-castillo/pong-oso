extends Label
# Shows the game options as
# strings like this:
#> P1 vs COM
#  P1 vs P2

var options_text = "> P1 vs COM\nP1 vs P2 "

func _ready():
	text = options_text
	
func _on_title_screen_option_switch(option):
	if option == 0:
		options_text = "> P1 vs COM\nP1 vs P2 "
	else:
		options_text = "P1 vs COM\n> P1 vs P2 "
	text = options_text
