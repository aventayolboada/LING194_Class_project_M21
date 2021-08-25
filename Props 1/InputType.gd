extends Node

func _ready():
	pass

func _on_TextureButton_pressed():
	$PopupMenu.popup()

func _on_LineEdit_text_entered(new_text):
	if new_text == "mitochondria":
		$PopupMenu.hide()
		$Correct.popup()
	else:
		$Wrong.popup()

func _on_Wrong_confirmed():
	$Wrong.hide()
	$PopupMenu.popup()

