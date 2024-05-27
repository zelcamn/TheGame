extends Node2D

const enemy = preload("res://gameFiles/battle_scenes/slime.tscn")
const attack = preload("res://gameFiles/battle_scenes/core_attack_patern.tscn")
const player_heart_scene = preload("res://gameFiles/battle_scenes/player_heart.tscn")
const slime_projectile_scene = preload("res://gameFiles/battle_scenes/slime_projectile.tscn")
const slime_projectile_2_scene = preload("res://gameFiles/battle_scenes/slime_projectile_2.tscn")
# Called when the node enters the scene tree for the first time.
var block = 0

var enemy_is_dead : bool
var player_turn_is_finished : bool
var player_is_dead : bool
var projectile_is_denied : bool
var mob_turn_is_finished : bool
var temp : Node

var player_heart_node = player_heart_scene.instantiate()
var enemy_core_node = enemy.instantiate()
var attack_node = attack.instantiate()

@onready var timer = $Timer
	
func _ready():
	###get_node("Control").set_visible(false)
	#temp = get_node("Attack x1")
	#remove_child(temp)
	#attack_x3_on_coldown()
	GlobalInfo.current_player_health = 100
	EventBus.connect("mob_turn_is_finished", mob_finish_sign)
	EventBus.connect("projectile_is_denied", projectile_is_denied_sign)
	EventBus.connect("player_is_dead", player_is_dead_sign)
	EventBus.connect("player_turn_is_finished", player_finish_sign)
	EventBus.connect("enemy_is_dead", enemy_dead_sign)
	#var enemy = enemy.instantiate()
	
	#enemy_core_node.global_position = Vector2(960,700)
	#add_child(enemy_core_node)
	#enemy_core_node = enemy # Replace with function body.
	player_turn()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#attack_x3_on_coldown()
	if player_turn_is_finished and GlobalInfo.has_no_timers == true:
		#await get_tree().create_timer(1).timeout
		mob_turn()
		player_turn_is_finished = false
		
	if mob_turn_is_finished and GlobalInfo.has_no_timers == true:
		#await get_tree().create_timer(1).timeout
		player_turn()
		mob_turn_is_finished = false
		
	#if_turn_finished()
	
	if enemy_is_dead:
		await get_tree().create_timer(1).timeout
		#get_tree().change_scene_to_file("res://gameFiles/scenes/dev_scene.tscn")
		EventBus.emit_signal("open_world_is_begin")
		enemy_is_dead = false
		
	if player_is_dead:
		get_tree().quit()

#func if_turn_finished():
	#if player_turn_is_finished and GlobalInfo.has_no_timers == true:
		#await get_tree().create_timer(1).timeout
		#get_tree().change_scene_to_file("res://gameFiles/battle_scenes/slime_attack_scene.tscn")
		#player_turn_is_finished = false

func _on_attack_x1_pressed():
	#var attack = attack.instantiate()
	attack_node.line = [[Vector2(960,200),90,Vector2(0,1)]]
	add_child(attack_node)
	block_buttons(true)
	EventBus.emit_signal("attack_is_pressed")


func _on_attack_x_3_pressed():
	#var attack = attack.instantiate()
	attack_node.line = [[Vector2(350,700),0,Vector2(1,0)],[Vector2(365,220),35,Vector2(1.15,0.85)],
[Vector2(1550,220),145,Vector2(-1.3,0.85)]]
		#attack.scale = Vector2(2,2)
	add_child(attack_node)
		#$"Attack x1".release_focus()
	block_buttons(true)
	EventBus.emit_signal("attack_is_pressed")
	GlobalInfo.attack_x3_coldown = 3
	
func player_turn():
	#get_node("Control").set_visible(true)
	#var enemy = enemy.instantiate()
	
	enemy_core_node.global_position = Vector2(960,700)
	add_child(enemy_core_node)
	#enemy_core_node = enemy
	
	
func mob_turn():
	
	timer.start()
	#var player_heart = player_heart_scene.instantiate()
	player_heart_node.global_position = Vector2(960,700)
	add_child(player_heart_node) 
	#player_heart_node = player_heart

func attack_x3_on_coldown():
	if GlobalInfo.attack_x3_coldown > 0:
		$"Control/Attack x3".disabled = true
		GlobalInfo.attack_x3_coldown -= 1
	
		
func _on_defense_pressed():
	GlobalInfo.player_shield += 1
	block_buttons(true)
	EventBus.emit_signal("player_turn_is_finished")# Replace with function body.
	
func _on_heal_pressed():
	block_buttons(true) # Replace with function body.

func block_buttons(set_:bool):
	
	$"Control/Attack x1".disabled = set_
	$"Control/Attack x3".disabled = set_
	$Control/defense.disabled = set_
	$Control/heal.disabled = set_
 # Replace with function body.
func create_slime_projectile(pos,rot,dir):
	
	var slime_projectile = slime_projectile_scene.instantiate()
	slime_projectile.global_position = pos #позиция
	slime_projectile.rotation_degrees = rot #угол поворота
	slime_projectile.direction = dir #направление (можно суммировать векторы)

	add_child(slime_projectile) 
	
func create_slime_projectile_2(pos,rot):
	var slime_projectile_2 = slime_projectile_2_scene.instantiate()
	slime_projectile_2.global_position = pos #позиция
	slime_projectile_2.rotation_degrees = rot 
	add_child(slime_projectile_2) 

func slime_attack_patern_1():
	var slime_projectile = slime_projectile_scene.instantiate()
	var i = 0
	var j = 0
	
	while i < 960:
		create_slime_projectile(Vector2(520+i,400),-90,Vector2(0,1))
		i += 125
		
	while j < 1125:
		create_slime_projectile(Vector2(457.5+j,1000),90,Vector2(0,-1))
		j += 125
		
	await get_tree().create_timer(1.5).timeout	
	
	i = 0	
	j = 0
	while i < 500:
		create_slime_projectile(Vector2(1540,500+i),0,Vector2(-1.5,0))
		i += 135
	
	while j < 375:
		create_slime_projectile(Vector2(380,562.5+j),180,Vector2(1.5,0))
		j += 135
	
	await get_tree().create_timer(2.5).timeout
	EventBus.emit_signal("mob_turn_is_finished")

	
func slime_attack_patern_2():
	var i=0	
	
	while i < 80:
		create_slime_projectile_2(Vector2(randf_range(480,1420),randf_range(500,940)),0)
		i += 1
	await get_tree().create_timer(2.5).timeout
	EventBus.emit_signal("mob_turn_is_finished")

func enemy_dead_sign():
	enemy_is_dead = true
	GlobalInfo.current_mob_health = 0
	
func player_finish_sign():
	#remove_child(enemy_core_node)
	await get_tree().create_timer(1).timeout
	player_turn_is_finished = true
	remove_child(enemy_core_node)
	get_node("Control").set_visible(false)
	
func mob_finish_sign():
	
	await get_tree().create_timer(1).timeout
	mob_turn_is_finished = true
	remove_child(player_heart_node)
	get_node("Control").set_visible(true)
	
	block_buttons(false)
	attack_x3_on_coldown()
	
func player_is_dead_sign():
	player_is_dead = true

func projectile_is_denied_sign():
	projectile_is_denied = true
	


func _on_timer_timeout():
	var patern = randi_range(1,2)
	if patern == 1:
		slime_attack_patern_1()
	elif patern == 2: # Replace with function body.
		slime_attack_patern_2()
	pass # Replace with function body.
