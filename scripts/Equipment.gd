extends Node2D
class_name PickableItems

@export var name1: String = ""
@export var attack_damage: float = 0.0
@export var hp_bonus: float = 0.0
@export var is_picked: bool = false

func _ready():
	pass

func setItemStats(newName, newDamage, newHP):
	name1 = newName
	attack_damage = float(newDamage)
	hp_bonus = float(newHP)
	is_picked = true

	print("Equipment:\n",name1,"\n", )
	print("Attack damage:\n",attack_damage,"\n", )
	print("HP bonus:\n",hp_bonus,"\n", )
	
