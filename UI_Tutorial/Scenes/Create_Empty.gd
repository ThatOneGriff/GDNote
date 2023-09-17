extends Button

signal empty_creation_without_saving



#	====		SIGNALS			====



func _on_pressed():
	
	focus_mode = Control.FOCUS_NONE
	
	if Globals.changes_to_current_file_have_been_made == true:
		
		%SoundEffectPlayer.stream = Globals.pop_up_sound
		
		%SoundEffectPlayer.play()
		%Screen_Animations.play("Darken_Screen")
		
		empty_creation_without_saving.emit()
	
	else:
		
		$"../../..".new_empty()
