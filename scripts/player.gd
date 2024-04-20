extends Node2D

var health = Health.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	health.maxHealth = GlobalInfo.playerHealth
	health.health = GlobalInfo.playerHealth
	
