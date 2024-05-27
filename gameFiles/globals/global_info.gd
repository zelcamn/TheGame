extends Node

var playerSpeed = 300
var playerHealth = 100
@export var current_player_health : int
var playerBaseDamage = 5
var player_shield : int

#параметры мобов
var slimeHealth = 20
var slime_attack_damage = 10
@export var current_mob_health : int


#вспомогательные
var attack_is_pressed = 0
var enemy_is_dead = 0

var isInventoryActive = false

var current_id = 0

var attack_x3_coldown : int

var has_no_timers := true

func reset_coldowns():
	attack_x3_coldown = 0

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
	
func sprite_flash(sprite):
	var tween : Tween = create_tween()
	tween.tween_property(sprite, "modulate:v", 1, 0.25).from(15)
