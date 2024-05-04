extends Control
class_name Item_UI

@export var resource: Item

var isActive = false
var id: int

func _ready():
	$ColorRect/ItemTexture.texture = resource.texture


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if isActive and Input.is_action_just_released("interaction"):
		EventBus.emit_signal("equip", self)
	if isActive and Input.is_action_pressed("deleteItem"):
		delete_self()

func _on_color_rect_mouse_entered():
	isActive = true


func _on_color_rect_mouse_exited():
	isActive = false

func delete_self():
	EventBus.emit_signal("item_delete", id)
	queue_free()
