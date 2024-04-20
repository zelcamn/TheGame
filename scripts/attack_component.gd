extends Node

class_name attack_component


var attack_damage = GlobalInfo.playerBaseDamage
#@export var MAX_HEALTH := 10.0 #передача макс хп при вызове сцены
#var MAX_HEALTH = Health
#var health : float

#Подгрузка хп при первом вызове
#func _ready():
	#health = MAX_HEALTH
	

func damage(health):
	health -= attack_damage #берётся из параметров оружия
	if health <= 0:
		get_parent().queue_free() #удаление сцены с экрана (скорее всего придётся заменить)
