extends Node

var dict = {
	"table": "mésá",
	"plate": "kò'ò",
	"fork": "trínchí",
	"spoon": "kúchárá",
	"glass": "vásó",
	"knife": "yuchì",
	"TV": "tele",
	"door": "yé'é",
	"sofa": "nuú koó",
	"cup":"táxá",
	"apple": "mansáná",
	"pineapple": "vixìn",
	"pitaya": "shìchì",
	"chocolate": "sò'và",
	"coffee": "kafeè",
	"tea": "téè",
	"water": "txìkuìí",
	"rose": "ita rròsá",
	"lily": "ita tuséná",
	"orchid": "ita lakoso"
}

func show_translation(word):
	var translation = "%s\n(%s)"
	var label = get_node("Translation/CenterContainer/Label")
	# Mixtec translation on 1st line, English translation on 2nd line
	label.set_text(translation % [dict[word], word])
	# Keeps the popup window centered
	$Translation.popup_centered_clamped()


func _on_table_pressed():
	show_translation("table")


func _on_plate_pressed():
	show_translation("plate")
	

func _on_fork_pressed():
	show_translation("fork")


func _on_spoon_pressed():
	show_translation("spoon")


func _on_glass_pressed():
	show_translation("glass")


func _on_knife_pressed():
	show_translation("knife")


func _on_TV_pressed():
	show_translation("TV")


func _on_door_pressed():
	show_translation("door")


func _on_sofa_pressed():
	show_translation("sofa")


func _on_cup_pressed():
	show_translation("cup")


func _on_apple_pressed():
	show_translation("apple")


func _on_pineapple_pressed():
	show_translation("pineapple")


func _on_pitaya_pressed():
	show_translation("pitaya")


func _on_chocolate_pressed():
	show_translation("chocolate")


func _on_coffee_pressed():
	show_translation("coffee")


func _on_tea_pressed():
	show_translation("tea")


func _on_water_pressed():
	show_translation("water")


func _on_rose_pressed():
	show_translation("rose")


func _on_lily_pressed():
	show_translation("lily")


func _on_orchid_pressed():
	show_translation("orchid")
