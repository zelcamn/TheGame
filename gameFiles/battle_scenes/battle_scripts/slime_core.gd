extends CharacterBody2D

#class_name slime

var is_enemy: bool = true

@export var hp : attack_component

var health = Health.new()
#var dmg = GlobalInfo.playerBaseDamage #урон персонажа (временно из глобальных)

#подгрузка начальных хп
func _ready():
	if !GlobalInfo.current_mob_health:
		GlobalInfo.current_mob_health = GlobalInfo.slimeHealth
	else:
		GlobalInfo.current_mob_health = 5
	#GlobalInfo.current_mob_health = GlobalInfo.slimeHealth
	health.maxHealth = GlobalInfo.slimeHealth
	#health.health = GlobalInfo.slimeHealth
	health.health = GlobalInfo.current_mob_health
	#print(GlobalInfo.current_mob_health)

#функция для всех врагов чтобы наносить урон
func hit(attack_damage):
	#hp.damage(health.health,dmg)
	hp.damage(health.health,attack_damage)
	print("Current health: " + str(health.health))
	
	#health.health = hp.damage(health.health,dmg)
	health.health = hp.damage(health.health,attack_damage) #нанесение урона и возвращение хп
	global_position = Vector2(randf_range(700,1200),randf_range(400,700))
	#print("Taken " + str(dmg) + " damage")
	print("Health after damage: " + str(health.health) +"\n")
	return health.health
	
	
