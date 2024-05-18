extends Node2D

const enemy = preload("res://gameFiles/battle_scenes/slime_core.tscn")
const attack = preload("res://gameFiles/battle_scenes/core_attack_patern.tscn")
# Called when the node enters the scene tree for the first time.
var block = 0

var enemy_is_dead : bool
var turnFinished : bool
	
func _ready():
	attack_x3_on_coldown()
	EventBus.connect("turn_is_finished", finish_sign)
	EventBus.connect("enemy_is_dead", dead_sign)
	var enemy = enemy.instantiate()
	#enemy.scale = Vector2(10,10)
	enemy.global_position = Vector2(960,600)
	add_child(enemy) # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if_turn_finished()
	if enemy_is_dead:
		await get_tree().create_timer(1).timeout
		get_tree().change_scene_to_file("res://gameFiles/scenes/dev_scene.tscn")
		enemy_is_dead = false

func if_turn_finished():
	if turnFinished and GlobalInfo.has_no_timers == true:
		await get_tree().create_timer(1).timeout
		get_tree().change_scene_to_file("res://gameFiles/battle_scenes/slime_attack_scene.tscn")
		turnFinished = false

func _on_attack_x1_pressed():
	var attack = attack.instantiate()
	attack.line = [[Vector2(960,200),90,Vector2(0,1)]]
	add_child(attack)
	block_buttons(true)
	EventBus.emit_signal("attack_is_pressed")


func _on_attack_x_3_pressed():
	var attack = attack.instantiate()
	attack.line = [[Vector2(350,700),0,Vector2(1,0)],[Vector2(365,220),35,Vector2(1.15,0.85)],
[Vector2(1550,220),145,Vector2(-1.3,0.85)]]
		#attack.scale = Vector2(2,2)
	add_child(attack)
		#$"Attack x1".release_focus()
	block_buttons(true)
	EventBus.emit_signal("attack_is_pressed")
	GlobalInfo.attack_x3_coldown = 3
	
	

func attack_x3_on_coldown():
	if GlobalInfo.attack_x3_coldown > 0:
		$"Attack x3".disabled = true
		GlobalInfo.attack_x3_coldown -= 1
	
		
func _on_defense_pressed():
	GlobalInfo.player_shield += 1
	block_buttons(true)
	EventBus.emit_signal("turn_is_finished")# Replace with function body.
	
func _on_heal_pressed():
	block_buttons(true) # Replace with function body.

func block_buttons(set_:bool):
	$"Attack x1".disabled = set_
	$"Attack x3".disabled = set_
	$defense.disabled = set_
	$heal.disabled = set_
 # Replace with function body.

func dead_sign():
	enemy_is_dead = true
	GlobalInfo.current_mob_health = 0
	
func finish_sign():
	turnFinished = true
