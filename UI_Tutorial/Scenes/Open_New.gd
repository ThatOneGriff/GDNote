extends Button



#	====		SIGNALS		====	



func _on_pressed():
	
	focus_mode = Control.FOCUS_NONE
	
	%FileDialog.set_file_mode(%FileDialog.FILE_MODE_OPEN_FILE)
	%SoundEffectPlayer.stream = Globals.pop_up_sound
	%FileDialog.current_file = ""
	
	%Screen_Animations.play("Darken_Screen")
	%SoundEffectPlayer.play()
	%FileDialog.popup()
