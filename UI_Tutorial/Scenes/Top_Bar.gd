extends Control



func change_themes_to_black():
	
	for id in %Top_Bar_Controls.get_child_count():
		
		var curr_node: Node = $Top_Bar_Controls.get_child(id)
		
		if "change_theme_to_black" in curr_node: # custom methods are supported too
			curr_node.change_theme_to_black()
			return
		
		curr_node.add_theme_stylebox_override("normal", Themes.Button_Theme_B)
		curr_node.add_theme_stylebox_override("hover", Themes.Button_Pressed_Theme_B)
		curr_node.add_theme_stylebox_override("pressed", Themes.Button_Pressed_Theme_B)
		curr_node.add_theme_stylebox_override("focus", Themes.Button_Pressed_Theme_B)
		curr_node.add_theme_color_override("font_color",Themes.font_color_B)
		curr_node.add_theme_color_override("font_hover_color", Themes.font_pressed_color_B)
		curr_node.add_theme_color_override("font_pressed_color", Themes.font_pressed_color_B)



func change_themes_to_white():
	
	for id in %Top_Bar_Controls.get_child_count():
		
		var curr_node: Node = $Top_Bar_Controls.get_child(id)
		
		if "change_theme_to_white" in curr_node: # custom methods are supported too
			curr_node.change_theme_to_white()
			return
		
		curr_node.add_theme_stylebox_override("normal", Themes.Button_Theme_W)
		curr_node.add_theme_stylebox_override("hover", Themes.Button_Pressed_Theme_W)
		curr_node.add_theme_stylebox_override("pressed", Themes.Button_Pressed_Theme_W)
		curr_node.add_theme_stylebox_override("focus", Themes.Button_Pressed_Theme_W)
		curr_node.add_theme_color_override("font_color", Themes.font_color_W)
		curr_node.add_theme_color_override("font_hover_color", Themes.font_color_W)
		curr_node.add_theme_color_override("font_pressed_color", Themes.font_color_W)
