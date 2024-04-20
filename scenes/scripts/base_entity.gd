extends Node2D

var isActive = false

func is_active():
	isActive = !isActive

func _process(delta):
	if isActive and Input.is_action_just_pressed("interaction"):
		print("foo")
