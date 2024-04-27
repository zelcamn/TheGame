extends Control

@export var item_UI_scene: PackedScene
var count = 0

func _ready():
	close()

func _process(delta):
	if Input.is_action_just_released("openInventory"):
		if !GlobalInfo.isInventoryActive:
			open()
		else:
			close()

func close():
	visible = false
	GlobalInfo.isInventoryActive = false
	
func open():
	visible = true
	GlobalInfo.isInventoryActive = true

func add_item_UI(res: Resource, index: int):
	var newItem = item_UI_scene.instantiate()
	newItem.resource = res
	newItem.id = index
	$HBoxContainer/NinePatchRect/ScrollContainer/GridContainer.add_child(newItem)

func add_item_in_slot_UI(res: Resource):
	if res.type == 1:
		$HBoxContainer/VBoxContainer/WeaponSlot.resource = res
	if res.type == 2:
		$HBoxContainer/VBoxContainer/ArmorSlot.resource = res
