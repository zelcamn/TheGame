extends StaticBody2D

@export var resource: Resource
@export var testM: String

var isActive = false
var body_id

func _ready():
	pass
	#EventBus.body_entered.connect(is_active.bind(EventBus))

func is_active():
	isActive = !isActive

func _process(delta):
	if isActive and Input.is_action_just_pressed("interaction"):
		print(resource.run_effect(testM))
