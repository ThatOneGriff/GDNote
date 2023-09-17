extends Control

var settings_path: String = "user://GDNote_Settings.save"

signal exiting_without_saving



# since the purpose of this project is to understand Control nodes in Godot rather than anything else,
# the function below is copy-pasted with only minor tweaks. I know it might look a lil weird.

func load_settings():
	
	Globals.add_to_saveable_group()
	
	if not FileAccess.file_exists(settings_path):
		return
	
	var settings_file = FileAccess.open(settings_path, FileAccess.READ)
	
	while settings_file.get_position() < settings_file.get_length():
		
		var json_string = settings_file.get_line()
		var json = JSON.new()
		var parse_result = json.parse(json_string)
		if not parse_result == OK:
			print("JSON parse error: '", json.get_error_message(), "' in '", json_string, "' at line '", json.get_error_line(), "'")
			continue
		
		var saveable_nodes = get_tree().get_nodes_in_group("Saveable")
		var node_data = json.get_data()
		
		for current_node in saveable_nodes:
			for key in node_data.keys():
				if key in current_node:
					current_node.set(key, node_data[key])
					
					if key == "black_theme":
						Globals.bg_loaded = true
					if key == "font_size":
						Globals.font_size_loaded = true



func new_empty():
	
	Globals.changes_to_current_file_have_been_made = false
	Globals.current_path = ""
	%TextEdit.text = ""
	
	Globals.window_title = "GDNote | No file has been opened yet"
	DisplayServer.window_set_title(Globals.window_title)



func open_file(path: String):
	
	Globals.changes_to_current_file_have_been_made = false
	Globals.window_title = "GDNote | " + path
	DisplayServer.window_set_title(Globals.window_title)
	
	var new_file = FileAccess.open(path, FileAccess.READ)
	$TextEdit.text = new_file.get_as_text()



func save_file(path: String):
	
	Globals.changes_to_current_file_have_been_made = false
	Globals.current_path = path
	Globals.window_title = "GDNote | " + path
	DisplayServer.window_set_title(Globals.window_title)
	
	var new_file = FileAccess.open(path, FileAccess.WRITE)
	new_file.store_string($TextEdit.text)



func save_settings():
	
	var settings_file = FileAccess.open(settings_path, FileAccess.WRITE)
	
	var save_dict = {
		"black_theme" : $Theme_Changer.black_theme,
		"font_size" : Globals.font_size
	}
	
	var json_string = JSON.stringify(save_dict)
	settings_file.store_string(json_string)



func _ready():
	
	DisplayServer.window_set_min_size(Vector2(640, 480))
	
	var path: String = OS.get_cmdline_args()[0] # this is why 'Main.tscn' opens when running this project in Godot
	
	if path == "":
		DisplayServer.window_set_title(Globals.window_title)
		%TextEdit.text = ""
	
	else:
		Globals.current_path = path
		open_file(path)
	
	load_settings()
	
	%TextEdit.add_theme_font_size_override("font_size", Globals.font_size)
	%Font_Size_Changer.update_text()
	
	if $Theme_Changer.black_theme:
		$Theme_Changer.change_theme_to_black()
	else:
		$Theme_Changer.change_theme_to_white()



func _process(_delta):
	
#	print(Globals.current_path) # debug purposes
	if Input.is_action_just_pressed("Quick Save"):
		%Save_Current.save() # if path is empty, the save will be automatically redirected to '%Save_As.save()'
	
	if Input.is_action_just_pressed("Force Stop"): # alt+F4
		get_tree().quit()



#	====		SIGNALS			====




func _notification(what):
	
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		
		if Globals.changes_to_current_file_have_been_made:
			$SoundEffectPlayer.stream = Globals.pop_up_sound
			
			%Screen_Animations.play("Darken_Screen")
			$SoundEffectPlayer.play()
			exiting_without_saving.emit()
		
		else:
			get_tree().quit()


func _on_file_dialog_file_selected(path: String):
	
	if %FileDialog.get_file_mode() == %FileDialog.FILE_MODE_OPEN_FILE:
		Globals.current_path = path
		open_file(path)
	
	elif %FileDialog.get_file_mode() == %FileDialog.FILE_MODE_SAVE_FILE:
		save_file(path)
		
	%Screen_Animations.play("Undarken_Screen")


func _on_text_edit_text_changed():
	
	if Globals.current_path == '':
		return
	
	Globals.changes_to_current_file_have_been_made = true
	DisplayServer.window_set_title(Globals.window_title + '*')
