extends Node2D

onready var Close = get_node("Background/Close_Icon")
onready var Bg_label = get_node("Background/Label")
onready var Backpack = get_parent()

func _ready():
	Bg_label.text = "UserName's \nBackpack"
