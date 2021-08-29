extends Node2D

const SlotClass = preload("res://Props 2/slot.gd")
onready var backpack_slots = $GridContainer
var holding_item = null

func _ready():
	for backpack_slot in backpack_slots.get_children():
		backpack_slot.connect("gui_input", self, "slot_gui_input", [backpack_slot])

func slot_gui_input(event: InputEvent, slot: SlotClass):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT && event.pressed:
			if holding_item != null: # place into empty slot
				if !slot.item:
					slot.putIntoSlot(holding_item)
					holding_item = null
				else: # swap holding item with item in the selected slot
					var temp_item = slot.item
					slot.pickFromSlot()
					temp_item.global_position = event.global_position
					slot.putIntoSlot(holding_item)
					holding_item = temp_item
					holding_item.global_position = get_global_mouse_position()
			elif slot.item: # start holding the item
				holding_item = slot.item
				slot.pickFromSlot()
				holding_item.global_position = get_global_mouse_position()

func _input(event):
	if holding_item:
		holding_item.global_position = get_global_mouse_position()
