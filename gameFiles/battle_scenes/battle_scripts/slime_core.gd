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
	#else:
		#print(GlobalInfo.current_mob_health)
	#GlobalInfo.current_mob_health = GlobalInfo.slimeHealth
	health.maxHealth = GlobalInfo.slimeHealth
	#health.health = GlobalInfo.slimeHealth
	health.health = GlobalInfo.current_mob_health
	
	print(GlobalInfo.current_mob_health)

#функция для всех врагов чтобы наносить урон
func hit(attack_damage):
	
	hp.damage(health.health,attack_damage)
	print("Current health: " + str(health.health))
	

	
	health.health = hp.damage(health.health,attack_damage) #нанесение урона и возвращение хп
	GlobalInfo.current_mob_health = health.health
	
	await GlobalInfo.sprite_flash($Sprite2D)
	global_position = Vector2(randf_range(800,1070),randf_range(850,600))
	
	print("Health after damage: " + str(health.health) +"\n")
	return health.health
	
	
