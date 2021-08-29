extends Control


onready var ChoiceBox = get_node("QuizWindow/ChoiceBox")
onready var QuizWindow = get_node("QuizWindow")
onready var OKButton = get_node("QuizWindow/OKButton")
onready var Correct = get_node("Correct")
onready var Wrong = get_node("Wrong")

# Called when the node enters the scene tree for the first time.
func _ready():
	var choices = ["bed", "chair", "fridge", "desk"]
	for choice in choices:
		ChoiceBox.add_item(choice)

func _on_ok_button_up():
	QuizWindow.visible = false
	if ChoiceBox.get_item_text(ChoiceBox.selected) == "bed":
		Correct.visible = true
	else:
		Wrong.visible = true
		_on_Wrong_popup_hide()

func _on_trigger_button_up():
	QuizWindow.visible = true


func _on_Wrong_popup_hide():
	QuizWindow.visible = true
