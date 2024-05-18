extends StaticBody2D
class_name BaseEntity

@export var resource: Item

var isActive = false

func _ready():
	$Sprite.texture = resource.texture

func is_active():
	isActive = !isActive

func _process(delta):
	if isActive and Input.is_action_just_pressed("interaction") and !GlobalInfo.isInventoryActive:
		if resource.has_method("interact"):
			pick_up()
			self.queue_free()

func pick_up():
	EventBus.emit_signal("item_pick", resource, GlobalInfo.get_new_id())
