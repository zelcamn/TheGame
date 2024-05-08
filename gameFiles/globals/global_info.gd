extends Node

var playerSpeed = 100
var playerHealth = 100

var isInventoryActive = false

var current_id = 0

func get_new_id():
	var result = current_id
	current_id += 1
	return result

func get_player_weapon():
	var weapon = get_tree().get_nodes_in_group("Player")[0].inventory.weapon
	return weapon
	
func get_player_armor():
	var armor = get_tree().get_nodes_in_group("Player")[0].inventory.armor
	return armor

func get_player_hp():
	var hp = get_tree().get_nodes_in_group("Player")[0].health.health
	return hp

func set_player_hp(hp: int):
	var player = get_tree().get_nodes_in_group("Player")[0]
	player.health.health = hp
	return player.health.health
