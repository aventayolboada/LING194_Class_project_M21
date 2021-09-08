extends Node2D

onready var button = get_node("Panel/Button")
onready var text = get_node("Panel/RichTextLabel")
onready var panel = get_node("Panel")

func _on_Button_button_up():
	button.hide()
	text.hide()
	panel.hide()
	
