extends Control

var selected_tex = preload("res://Props 2/images/item_slot_selected_background.png")
var selected_style: StyleBoxTexture = null

onready var ChoiceBox = get_node("QuizWindow/ChoiceBox")
onready var QuizWindow = get_node("QuizWindow")
onready var OKButton = get_node("QuizWindow/OKButton")
onready var Question = get_node("QuizWindow/Question")
onready var Correct = get_node("Correct")
onready var Wrong = get_node("Wrong")
onready var ThumbsUp = get_node("../../ThumbsUp")
onready var CongratsMsg = get_node("../../CongratsMsg")

onready var choices = []
onready var wordbank = ["rabbitM", "plateM", "birdM", "maskM", "foxM", "doorM", "cupM", "bowlM"]
onready var dictionary = {"rabbit": "rabbitM", "plate": "plateM", "bird" : "birdM", "mask" : "maskM", "fox": "foxM", "door" : "doorM", "cup" : "cupM", "bowl" : "bowlM"}
onready var remainNum = wordbank.size()
onready var choiceNum = 4
onready var targetWordENG
onready var targetWordMIX
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
	if ChoiceBox.get_item_text(ChoiceBox.selected) == targetWordMIX:
		Correct.visible = true		
		
		get_node("../../GridContainer/"+ targetWordENG +"/Collected").visible = false
		get_node("../../GridContainer/"+ targetWordENG +"/Uncollected").visible = true
		get_node("../../GridContainer/"+ targetWordENG +"/Node2D").visible = false
		get_node("../../GridContainer/"+ targetWordENG).set('custom_styles/panel', selected_style)
		
		remainNum -= 1
		if (!remainNum):
			ThumbsUp.visible = true
			CongratsMsg.visible = true
		
	else:
		Wrong.visible = true
		_on_Wrong_popup_hide()

#func _on_Button_button_up(extra_arg_0):
func _action(button : Button) -> void:
	targetWordENG = button.name
	targetWordMIX = dictionary[targetWordENG]
	_generate_QuizWindow(targetWordENG, targetWordMIX)
	QuizWindow.visible = true

func _generate_QuizWindow(targetWordENG, targetWordMIX):
	ChoiceBox.clear()
	choices.clear()
	
	Question.text = "How do you say " + targetWordENG + " in Mixtec?"
	
	wordbank.erase(targetWordMIX)
	
	for i in range(choiceNum):
		var choiceIndex = randi()%(wordbank.size())
		while choices.find(wordbank[choiceIndex]) != -1:
			choiceIndex = randi()%(wordbank.size())
		choices.append(wordbank[choiceIndex])
	choices[randi()%(choiceNum)] = targetWordMIX
	
	wordbank.append(targetWordMIX)
	
	for choice in choices:
		ChoiceBox.add_item(choice)

func _on_Wrong_popup_hide():
	QuizWindow.visible = true
