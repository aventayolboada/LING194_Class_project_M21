extends Panel

func _ready():
	get_node("Button").connect("pressed", self, "_on_Button_pressed")

func _on_Button_pressed():
	$Button.hide()
	$RichTextLabel.hide()
	get_tree().change_scene("res://House/house_sprites/Version2.tscn")
	
