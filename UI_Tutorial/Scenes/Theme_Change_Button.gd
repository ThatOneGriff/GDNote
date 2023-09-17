extends Button

var moon_icon = load("res://UI/Pics/moon.png")
var sun_icon = load("res://UI/Pics/sun.png")



func change_theme_to_black():
	
	modulate = Color("eadbc8")
	icon = sun_icon



func change_theme_to_white():
	
	modulate = Color("2b2b2b")
	icon = moon_icon



#	====		SIGNALS			====



func _on_pressed():
	
	focus_mode = Control.FOCUS_NONE
