extends StaticBody2D

@export var resource: Resource

var isActive = false

func is_active():
	isActive = !isActive

func _process(delta):
	if isActive and Input.is_action_just_pressed("interaction"):
		if resource.has_method("interact"):
			pick_up()

func pick_up():
	EventBus.emit_signal("item_pick", resource)
