extends Label



func blink_text(text_to_blink: String):
	
	text = text_to_blink
	$AnimationPlayer.stop()
	$AnimationPlayer.play("Double_Blink_Then_Hide")



func _ready():
	
	text = ""



#	====		SIGNALS			====
