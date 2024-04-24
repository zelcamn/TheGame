extends Node

var playerSpeed = 100
var playerHealth = 100

var isInventoryActive = false

var current_id = 0

func get_new_id():
	var result = current_id
	current_id += 1
	return result
