extends Node2D

onready var Close = get_node("Background/Close_Icon")
onready var Bg_label = get_node("Background/Label")
onready var Backpack = get_parent()

func _on_Close_Icon_button_up():
	Backpack.visible = false

func _ready():
	Bg_label.text = "UserName's \nBackpack"
