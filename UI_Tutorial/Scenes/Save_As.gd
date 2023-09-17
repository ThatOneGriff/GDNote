extends Button



# for external access

func save():
	
	%Screen_Animations.play("Darken_Screen")
	%FileDialog.set_file_mode(%FileDialog.FILE_MODE_SAVE_FILE)
	%FileDialog.popup()



#	====		SIGNALS			====


func _on_pressed():
	
	focus_mode = Control.FOCUS_NONE
	
	%SoundEffectPlayer.stream = Globals.pop_up_sound
	%SoundEffectPlayer.play()
	
	save()
