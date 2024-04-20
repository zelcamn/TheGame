extends Node

class_name HealthComponent

@export var attack_damage := 5.0
@export var MAX_HEALTH := 10.0 #передача макс хп при вызове сцены
var health : float

#Подгрузка хп при первом вызове
func _ready():
	health = MAX_HEALTH
	

func damage():
	health -= attack_damage #берётся из параметров оружия
	print(health)
	if health <= 0:
		get_parent().queue_free() #удаление сцены с экрана (скорее всего придётся заменить)
