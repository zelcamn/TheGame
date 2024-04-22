extends Node
class_name Inventory

var weapon: Resource
var armor: Resource

var items: Array

func append(item: Resource):
	items.append(item)

func pop(index: int):
	items.pop_at(index)

func assign_weapon(index: int):
	var buffer = weapon
	weapon = items[index]
	items[index] = buffer

func assign_armor(index: int):
	var buffer = armor
	armor = items[index]
	items[index] = buffer
