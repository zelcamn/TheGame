extends Node
class_name Inventory

var weapon: Resource = null
var armor: Resource = null

var items: Dictionary

func append(item: Resource, index: int):
	items[index] = item

func pop(index: int):
	var result = items[index]
	items.erase(index)
	return result

func assign_weapon(index: int):
	if weapon != null:
		var buffer = weapon
		weapon = items[index]
		return buffer
	weapon = items[index]
	return null

func assign_armor(index: int):
	if armor != null:
		var buffer = armor
		armor = items[index]
		return buffer
	armor = items[index]
	return null
