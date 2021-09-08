extends Node2D

onready var button = get_node("Panel/Button")
onready var text = get_node("Panel/RichTextLabel")
onready var panel = get_node("Panel")
onready var backpack = get_node("Backpack")

func _on_Button_button_up():
	button.hide()
	text.hide()
	panel.hide()
	


func _on_Button_pressed():
	backpack.visible = true


func _on_Close_Icon_pressed():
	backpack.visible = false
