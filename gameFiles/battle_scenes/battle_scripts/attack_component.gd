extends Node

#цепляется к сцене моба
class_name attack_component


#var attack_damage = GlobalInfo.playerBaseDamage #временно установлен базовый урон
#var test = preload("res://gameFiles/player/systems/inventory/items/customResources/weapons/base_wapon.tres")
 

func damage(health, attack_damage):
	health -= attack_damage #берётся из параметров оружия
	#print(health)
	if health <= 0:
		get_parent().queue_free() #удаление сцены с экрана (скорее всего придётся заменить)
		
	return health
