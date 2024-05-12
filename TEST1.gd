extends Node2D

const enemy = preload("res://gameFiles/battle_scenes/heart.tscn")
const attack = preload("res://gameFiles/battle_scenes/core_attack_patern.tscn")
# Called when the node enters the scene tree for the first time.
var block = 0

var enemy_is_dead : bool
var turnFinished : bool
	
func _ready():
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
		get_tree().change_scene_to_file("res://gameFiles/scenes/dev_scene.tscn")
		enemy_is_dead = false

func if_turn_finished():
	if turnFinished:
		print("Tsr")
		get_tree().change_scene_to_file("res://temp_enemy_attack.tscn")
		turnFinished = false

func _on_attack_x1_pressed():
	if block == 0:
		var attack = attack.instantiate()
		attack.line = [[Vector2(960,200),90,Vector2(0,1)]]
		add_child(attack)
		block_buttons(true)
		EventBus.emit_signal("attack_is_pressed")
		block = 1 # Replace with function body.


func _on_attack_x_3_pressed():
	if block == 0:
		var attack = attack.instantiate()
		attack.line = [[Vector2(350,550),0,Vector2(1,0)],[Vector2(365,220),35,Vector2(1.15,0.85)],
[Vector2(1550,220),145,Vector2(-1.3,0.85)]]
		#attack.scale = Vector2(2,2)
		add_child(attack)
		#$"Attack x1".release_focus()
		block_buttons(true)
		EventBus.emit_signal("attack_is_pressed")
		block = 1  # Replace with function body.
		
func _on_defense_pressed():
	block_buttons(true) # Replace with function body.
	
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
	
func finish_sign():
	turnFinished = true
