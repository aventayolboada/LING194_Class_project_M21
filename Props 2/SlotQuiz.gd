extends Control

var selected_tex = preload("res://Props 2/images/item_slot_selected_background.png")
var selected_style: StyleBoxTexture = null

onready var ChoiceBox = get_node("QuizWindow/ChoiceBox")
onready var QuizWindow = get_node("QuizWindow")
onready var OKButton = get_node("QuizWindow/OKButton")
onready var Correct = get_node("Correct")
onready var Wrong = get_node("Wrong")
onready var choices = []
onready var wordbank = ["rabbit", "plate", "bird", "mask", "fox", "door", "cup", "bowl"]
onready var choiceNum = 4
onready var targetWord
onready var targetIndex

# list of buttons of words
onready var rabbit = get_node("../../GridContainer/rabbit/Node2D/rabbit")
onready var plate = get_node("../../GridContainer/plate/Node2D/plate")
onready var bird = get_node("../../GridContainer/bird/Node2D/bird")
onready var mask = get_node("../../GridContainer/mask/Node2D/mask")
onready var fox = get_node("../../GridContainer/fox/Node2D/fox")
onready var door = get_node("../../GridContainer/door/Node2D/door")
onready var cup = get_node("../../GridContainer/cup/Node2D/cup")
onready var bowl = get_node("../../GridContainer/bowl/Node2D/bowl")

func _ready() -> void:
	selected_style = StyleBoxTexture.new()
	selected_style.texture = selected_tex
	
	# list of buttons of words
	rabbit.connect("button_up", self, "_action", [rabbit])
	plate.connect("button_up", self, "_action", [plate])
	bird.connect("button_up", self, "_action", [bird])
	mask.connect("button_up", self, "_action", [mask])
	fox.connect("button_up", self, "_action", [fox])
	door.connect("button_up", self, "_action", [door])
	cup.connect("button_up", self, "_action", [cup])
	bowl.connect("button_up", self, "_action", [bowl])

func _on_ok_button_up():
	QuizWindow.visible = false
	if ChoiceBox.get_item_text(ChoiceBox.selected) == targetWord:
		Correct.visible = true
		get_node("../../GridContainer/"+ targetWord +"/Collected").visible = false
		get_node("../../GridContainer/"+ targetWord +"/Uncollected").visible = true
		get_node("../../GridContainer/"+ targetWord +"/Node2D").visible = false
		get_node("../../GridContainer/"+ targetWord).set('custom_styles/panel', selected_style)
	else:
		Wrong.visible = true
		_on_Wrong_popup_hide()

#func _on_Button_button_up(extra_arg_0):
func _action(button : Button) -> void:
	targetWord = button.name
	_generate_QuizWindow(targetWord)
	QuizWindow.visible = true

func _generate_QuizWindow(targetWord):
	ChoiceBox.clear()
	choices.clear()
	var wordbankCOPY = wordbank
	wordbankCOPY.erase(targetWord)
	for i in range(choiceNum):
		var choiceIndex = randi()%(wordbankCOPY.size())
		while choices.find(wordbankCOPY[choiceIndex]) != -1:
			choiceIndex = randi()%(wordbankCOPY.size())
		choices.append(wordbankCOPY[choiceIndex])
	choices[randi()%(choiceNum)] = targetWord
	
	for choice in choices:
		ChoiceBox.add_item(choice)

func _on_Wrong_popup_hide():
	QuizWindow.visible = true
