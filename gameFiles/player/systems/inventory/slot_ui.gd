extends Item_UI

func _ready():
	pass

func _process(delta):
	if resource != null:
		$ColorRect/ItemTexture.texture = resource.texture
	else:
		$ColorRect/ItemTexture.texture = null
	if isActive and Input.is_action_pressed("deleteItem") and resource != null:
		delete_self()

func delete_self():
	EventBus.emit_signal("item_unequip", resource)
	resource = null
