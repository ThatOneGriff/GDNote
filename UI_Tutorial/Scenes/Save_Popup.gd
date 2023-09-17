extends Control

var next_operation: String

# Why is this one a crap ton of nodes rather than an imported scene? Well, this way I couldn't get it's script to
# work with other nodes of 'Main' scene without sending a whole lot of signals.



# These theme changers might look messy. That's because I didn't want to create scripts for every button of this
# popup, as they'd frankly be useless other than a theme change situation. So it was a choice between creating
# a mess in the files, or in the script.
func change_theme_to_black():
	
	$Background.color = Color("2b2b2b")
	
	$Header/Background.color = Color("222222")
	$Header/Title.add_theme_color_override("font_color", Themes.font_color_B)
	
	%x.add_theme_color_override("font_color", Themes.font_color_B)
	%x.add_theme_color_override("font_hover_color", Themes.font_pressed_color_B)
	%x.add_theme_color_override("font_pressed_color", Themes.font_pressed_color_B)
	%x.add_theme_stylebox_override("normal", Themes.Button_Theme_B)
	%x.add_theme_stylebox_override("hover", Themes.Button_Pressed_Theme_B)
	%x.add_theme_stylebox_override("pressed", Themes.Button_Pressed_Theme_B)
	%x.add_theme_stylebox_override("focus", Themes.Button_Pressed_Theme_B)
	
	$Middle_Part/Body_Text.add_theme_color_override("font_color", Themes.font_color_B)
	
	$Save_Button.add_theme_color_override("font_color", Themes.font_color_B)
	$Save_Button.add_theme_color_override("font_hover_color", Themes.font_pressed_color_B)
	$Save_Button.add_theme_color_override("font_pressed_color", Themes.font_pressed_color_B)
	$Save_Button.add_theme_stylebox_override("normal", Themes.Button_Theme_B)
	$Save_Button.add_theme_stylebox_override("hover", Themes.Button_Pressed_Theme_B)
	$Save_Button.add_theme_stylebox_override("pressed", Themes.Button_Pressed_Theme_B)
	$Save_Button.add_theme_stylebox_override("focus", Themes.Button_Pressed_Theme_B)
	
	$Dont_Save_Button.add_theme_color_override("font_color", Themes.font_color_B)
	$Dont_Save_Button.add_theme_color_override("font_hover_color", Themes.font_pressed_color_B)
	$Dont_Save_Button.add_theme_color_override("font_pressed_color", Themes.font_pressed_color_B)
	$Dont_Save_Button.add_theme_stylebox_override("normal", Themes.Button_Theme_B)
	$Dont_Save_Button.add_theme_stylebox_override("hover", Themes.Button_Pressed_Theme_B)
	$Dont_Save_Button.add_theme_stylebox_override("pressed", Themes.Button_Pressed_Theme_B)
	$Dont_Save_Button.add_theme_stylebox_override("focus", Themes.Button_Pressed_Theme_B)



# These theme changers might look messy. That's because I didn't want to create scripts for every button of this
# popup, as they'd frankly be useless other than a theme change situation. So it was a choice between creating
# a mess in the files, or in the script.
func change_theme_to_white():
	
	$Background.color = Color("eadbc8")
	
	$Header/Background.color = Color("dac0a3")
	$Header/Title.add_theme_color_override("font_color", Themes.font_color_W)
	
	%x.add_theme_color_override("font_color", Themes.font_color_W)
	%x.add_theme_color_override("font_hover_color", Themes.font_color_W)
	%x.add_theme_color_override("font_pressed_color", Themes.font_color_W)
	%x.add_theme_stylebox_override("normal", Themes.Button_Theme_W)
	%x.add_theme_stylebox_override("hover", Themes.Button_Pressed_Theme_W)
	%x.add_theme_stylebox_override("pressed", Themes.Button_Pressed_Theme_W)
	%x.add_theme_stylebox_override("focus", Themes.Button_Pressed_Theme_W)
	
	$Middle_Part/Body_Text.add_theme_color_override("font_color", Themes.font_color_W)
	
	$Save_Button.add_theme_color_override("font_color", Themes.font_color_W)
	$Save_Button.add_theme_color_override("font_hover_color", Themes.font_color_W)
	$Save_Button.add_theme_color_override("font_pressed_color", Themes.font_color_W)
	$Save_Button.add_theme_stylebox_override("normal", Themes.Button_Theme_W)
	$Save_Button.add_theme_stylebox_override("hover", Themes.Button_Pressed_Theme_W)
	$Save_Button.add_theme_stylebox_override("pressed", Themes.Button_Pressed_Theme_W)
	$Save_Button.add_theme_stylebox_override("focus", Themes.Button_Pressed_Theme_W)
	
	$Dont_Save_Button.add_theme_color_override("font_color", Themes.font_color_W)
	$Dont_Save_Button.add_theme_color_override("font_hover_color", Themes.font_color_W)
	$Dont_Save_Button.add_theme_color_override("font_pressed_color", Themes.font_color_W)
	$Dont_Save_Button.add_theme_stylebox_override("normal", Themes.Button_Theme_W)
	$Dont_Save_Button.add_theme_stylebox_override("hover", Themes.Button_Pressed_Theme_W)
	$Dont_Save_Button.add_theme_stylebox_override("pressed", Themes.Button_Pressed_Theme_W)
	$Dont_Save_Button.add_theme_stylebox_override("focus", Themes.Button_Pressed_Theme_W)



func _ready():
	
	hide()



#	====		SIGNALS			====


func _on_outside_click_detector_pressed():
	
	%Screen_Animations.play("Undarken_Screen")
	hide()


func _on_x_pressed():
	
	%x.focus_mode = Control.FOCUS_NONE
	%Screen_Animations.play("Undarken_Screen")
	hide()


func _on_save_button_pressed():
	
	$Save_Button.focus_mode = Control.FOCUS_NONE
	%Save_Current.save()
	# after that, we wait for a signal that saving has been complete - '_on_save_current_save_current_dialog_can_proceed()'.
	# then, we do what we wanted to do - either exit or save.
	%Screen_Animations.play("Undarken_Screen")


func _on_dont_save_button_pressed():
	
	$Dont_Save_Button.focus_mode = Control.FOCUS_NONE
	if next_operation == "exit":
		$"..".get_tree().quit()
	
	elif next_operation == "new_empty":
		$"..".new_empty()
	
	next_operation = ""
	%Screen_Animations.play("Undarken_Screen")
	hide()


func _on_create_empty_empty_creation_without_saving():
	
	next_operation = "new_empty"
	show()



func _on_main_exiting_without_saving():
	
	next_operation = "exit"
	show()


func _on_save_current_save_popup_can_proceed():
	
	if next_operation == "exit":
		$"..".get_tree().quit()
	
	elif next_operation == "new_empty":
		
		%SoundEffectPlayer.stream = Globals.save_click_sound
		%SoundEffectPlayer.play()
		$"..".new_empty()
	
	next_operation = ""
	%Screen_Animations.play("Undarken_Screen")
	hide()
