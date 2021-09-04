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
onready var Zoom_Screenshot = get_node("Zoom_Screenshot")


onready var choices = []
onready var wordbank = ["mésá", "kò'ò", "téè", "kafeè", "txìkuìí", "yé'é", "táxá", "ita lakoso", "kúchárá", "trínchí", "yuchì", "vásó", "tele", "nuú koó", "mansáná", "shìchì", "vixìn", "ita rròsá", "ita tuséná", "sò'và"]
onready var dictionary = {"table": "mésá", "plate": "kò'ò", "tea" : "téè", "coffee" : "kafeè", "water": "txìkuìí", "door" : "yé'é", "cup" : "táxá", "orchid" : "ita lakoso",  "spoon" : "kúchárá", "fork" : "trínchí", "knife" : "yuchì", "glass" : "vásó", "TV" : "tele", "sofa" : "nuú koó", "apple" : "mansáná", "pitaya" : "shìchì", "pineapple" : "vixìn", "rose" : "ita rròsá", "lily" : "ita tuséná", "chocolate" : "sò'và"}
onready var remainNum = wordbank.size()
onready var choiceNum = 4
onready var targetWordENG
onready var targetWordMIX
onready var targetIndex

# list of buttons of words
onready var table = get_node("../../GridContainer/table/Node2D/table")
onready var door = get_node("../../GridContainer/door/Node2D/door")
onready var tea = get_node("../../GridContainer/tea/Node2D/tea")
onready var coffee = get_node("../../GridContainer/coffee/Node2D/coffee")
onready var water = get_node("../../GridContainer/water/Node2D/water")
onready var cup = get_node("../../GridContainer/cup/Node2D/cup")
onready var plate = get_node("../../GridContainer/plate/Node2D/plate")
onready var spoon = get_node("../../GridContainer/spoon/Node2D/spoon")
onready var fork = get_node("../../GridContainer/fork/Node2D/fork")
onready var knife = get_node("../../GridContainer/knife/Node2D/knife")
onready var glass = get_node("../../GridContainer/glass/Node2D/glass")
onready var chocolate = get_node("../../GridContainer/chocolate/Node2D/chocolate")
onready var apple = get_node("../../GridContainer/apple/Node2D/apple")
onready var pitaya = get_node("../../GridContainer/pitaya/Node2D/pitaya")
onready var pineapple = get_node("../../GridContainer/pineapple/Node2D/pineapple")
onready var TV = get_node("../../GridContainer/TV/Node2D/TV")
onready var sofa = get_node("../../GridContainer/sofa/Node2D/sofa")
onready var rose = get_node("../../GridContainer/rose/Node2D/rose")
onready var lily = get_node("../../GridContainer/lily/Node2D/lily")
onready var orchid = get_node("../../GridContainer/orchid/Node2D/orchid")

func _ready() -> void:
	selected_style = StyleBoxTexture.new()
	selected_style.texture = selected_tex
	
	# list of buttons of words
	table.connect("button_up", self, "_action", [table])
	door.connect("button_up", self, "_action", [door])
	tea.connect("button_up", self, "_action", [tea])
	coffee.connect("button_up", self, "_action", [coffee])
	water.connect("button_up", self, "_action", [water])
	cup.connect("button_up", self, "_action", [cup])
	plate.connect("button_up", self, "_action", [plate])
	spoon.connect("button_up", self, "_action", [spoon])
	fork.connect("button_up", self, "_action", [fork])
	knife.connect("button_up", self, "_action", [knife])
	glass.connect("button_up", self, "_action", [glass])
	chocolate.connect("button_up", self, "_action", [chocolate])
	apple.connect("button_up", self, "_action", [apple])
	pitaya.connect("button_up", self, "_action", [pitaya])
	pineapple.connect("button_up", self, "_action", [pineapple])
	TV.connect("button_up", self, "_action", [TV])
	sofa.connect("button_up", self, "_action", [sofa])
	rose.connect("button_up", self, "_action", [rose])
	lily.connect("button_up", self, "_action", [lily])
	orchid.connect("button_up", self, "_action", [orchid])

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


func _on_CongratsMsg_visibility_changed():
	Zoom_Screenshot.visible = true
