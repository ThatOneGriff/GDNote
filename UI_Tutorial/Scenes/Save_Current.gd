extends Button

signal save_popup_can_proceed



# for external access

func save():
	
	if Globals.current_path == "":
		%Save_As.save()
		return
	
	elif Globals.changes_to_current_file_have_been_made == false:
		%Warnings_And_Errors.blink_text("No changes to save!")
		return
	
	$"../../..".save_file(Globals.current_path)
	%Screen_Animations.play("Screen_Blink")
	
	if %Save_Popup.next_operation != "":
		save_popup_can_proceed.emit()




#	====		SIGNALS		====	



func _on_pressed():
	
	focus_mode = Control.FOCUS_NONE
	save()
