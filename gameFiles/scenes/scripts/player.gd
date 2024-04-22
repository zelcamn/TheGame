extends Node2D

var health = Health.new()
var inventory = Inventory.new()

func _ready():
	EventBus.connect("item_pick", add_item)
	
	health.maxHealth = GlobalInfo.playerHealth
	health.health = GlobalInfo.playerHealth

func _on_entity_collision_body_entered(body):
	if body.has_method("is_active"):
		body.call("is_active")
	#EventBus.emit_signal("body_entered", body)


func _on_entity_collision_body_exited(body):
	if body.has_method("is_active"):
		body.call("is_active")
	#EventBus.emit_signal("body_entered")

func add_item(item):
	inventory.append(item)
	print(inventory.items[-1])
