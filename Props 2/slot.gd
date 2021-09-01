extends Panel

var default_tex = preload("res://Props 2/images/item_slot_default_background.png")
var empty_tex = preload("res://Props 2/images/item_slot_empty_background.png")

var default_style: StyleBoxTexture = null
var empty_style: StyleBoxTexture = null

var ItemClass = preload("res://Props 2/Item.tscn")
var item = null

func _ready():
	default_style = StyleBoxTexture.new()
	empty_style = StyleBoxTexture.new()
	default_style.texture = default_tex
	empty_style.texture = empty_tex
	
func refresh_style():
	if item == null:
		set('custom_styles/panel', empty_style)
	else:
		set('custom_styles/panel', default_style)
