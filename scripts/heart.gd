extends CharacterBody2D

#class_name slime

var is_enemy: bool = true

@export var hp : attack_component

var health = Health.new()

func _ready():
	health.maxHealth = GlobalInfo.slimeHealth
	health.health = GlobalInfo.slimeHealth

func hit():
	hp.damage(health.health)
	print(health.health)
	print("Taken " + str(hp.attack_damage) + " damage")
