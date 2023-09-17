extends Node

# managing loading
var bg_loaded: bool = false
var font_size_loaded: bool = false

func add_to_saveable_group():
	
	add_to_group("Saveable")


# sound effects
var pop_up_sound = load("res://Sounds/pop_up.mp3")
var save_click_sound = load("res://Sounds/save_click.mp3")


# other things
var font_size: int = 16
var current_path: String = ""
var changes_to_current_file_have_been_made: bool = false
var window_title: String = "GDNote | No file has been opened yet"



#	====		SIGNALS			====
