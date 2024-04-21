extends CharacterBody2D

#class_name slime

var is_enemy: bool = true

@export var hp : attack_component

var health = Health.new()
var dmg = GlobalInfo.playerBaseDamage #урон персонажа (временно из глобальных)

#подгрузка начальных хп
func _ready():
	health.maxHealth = GlobalInfo.slimeHealth
	health.health = GlobalInfo.slimeHealth

#функция для всех врагов чтобы наносить урон
func hit():
	hp.damage(health.health,dmg)
	print("Current health: " + str(health.health))
	
	health.health = hp.damage(health.health,dmg) #нанесение урона и возвращение хп
	
	print("Taken " + str(dmg) + " damage")
	print("Health after damage: " + str(health.health) +"\n")
	return health.health
	
	
