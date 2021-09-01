extends Node2D

onready var Close = get_node("Background/Close_Icon")
onready var Backpack = get_parent()

func _on_Close_Icon_button_up():
	Backpack.visible = false
