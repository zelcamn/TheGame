extends Control

@export var item_UI_scene: PackedScene
var is_open = false
var count = 0

func _ready():
	EventBus.connect("item_delete", item_delete)
	
	close()

func _process(delta):
	if Input.is_action_just_pressed("openInventory"):
		if !is_open:
			open()
		else:
			close()

func close():
	visible = false
	is_open = false
	
func open():
	visible = true
	is_open = true

func add_item_UI(res: Resource):
	var newItem = item_UI_scene.instantiate()
	newItem.resource = res
	newItem.id = count
	$NinePatchRect/ScrollContainer/GridContainer.add_child(newItem)
	count += 1

func item_delete(index):
	count -= 1
