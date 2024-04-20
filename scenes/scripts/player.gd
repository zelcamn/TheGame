extends Node2D

var health = Health.new()

func _ready():
	health.maxHealth = GlobalInfo.playerHealth
	health.health = GlobalInfo.playerHealth




func _on_entity_collision_body_entered(body):
	if body.has_method("is_active"):
		body.call("is_active")


func _on_entity_collision_body_exited(body):
	if body.has_method("is_active"):
		body.call("is_active")
