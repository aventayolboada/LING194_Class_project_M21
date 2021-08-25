extends Node

func _ready():
	pass

func _on_TextureButton_pressed():
	$PopupMenu.popup()

func _on_Spiders_pressed():
	$No.popup()
	$PopupMenu.hide()

func _on_Dogs_pressed():
	$Yes.popup()
	$PopupMenu.hide()

func _on_No_confirmed():
	$PopupMenu.popup()
