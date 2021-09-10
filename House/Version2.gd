extends Node2D

onready var button = get_node("Panel/Button")
onready var text = get_node("Panel/RichTextLabel")
onready var panel = get_node("Panel")
onready var backpack = get_node("Backpack")
onready var table_collected = get_node("Backpack/GridContainer/table/Collected")
onready var table_uncollected = get_node("Backpack/GridContainer/table/Uncollected")
onready var player = get_node("Player")

func _on_Button_button_up():
	button.hide()
	text.hide()
	panel.hide()
	


func _on_Button_pressed():
	backpack.visible = true

func _on_Close_Icon_pressed():
	backpack.visible = false


func _on_Table_button_up():
	table_collected.visible = true
	table_uncollected.visible = false
