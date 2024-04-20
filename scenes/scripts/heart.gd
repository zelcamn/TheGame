extends CharacterBody2D

var is_enemy: bool = true

@export var hp : HealthComponent

func hit():
	hp.damage()
	print("Taken " + str(hp.attack_damage) + " damage")
