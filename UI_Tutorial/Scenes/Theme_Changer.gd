extends ColorRect

@export var black_theme: bool = true



func change_theme_to_black():
	
	%Background_Color_Rect.color = Color("2b2b2b")
	%Save_Popup.change_theme_to_black()
	%Theme_Change_Button.change_theme_to_black()
	%TextEdit.change_theme_to_black()
	%Top_Bar.change_themes_to_black()



func change_theme_to_white():
	
	%Background_Color_Rect.color = Color("eadbc8")
	%Save_Popup.change_theme_to_white()
	%Theme_Change_Button.change_theme_to_white()
	%TextEdit.change_theme_to_white()
	%Top_Bar.change_themes_to_white()



func _ready():
	
	hide()



#	====		SIGNALS			====



func _on_theme_change_button_pressed():
	
	black_theme = !black_theme
	$"..".save_settings()
	
	if black_theme:
		%Screen_Animations.play("Change_Theme_To_Black")
	else:
		%Screen_Animations.play("Change_Theme_To_White")
