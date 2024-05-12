extends Node

var playerSpeed = 300
var playerHealth = 100
var playerBaseDamage = 5

#параметры мобов
var slimeHealth = 20
@export var current_mob_health : int

#вспомогательные
var attack_is_pressed = 0
var enemy_is_dead = 0

var isInventoryActive = false

var current_id = 0



func get_new_id():
	var result = current_id
	current_id += 1
	return result

func get_player_weapon():
	#var weapon = get_tree().get_nodes_in_group("Player")[0].inventory.weapon
	var test = Inventory.new()
	var weapon = test.weapon
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
