extends Node2D

const enemy = preload("res://scenes/battle_scenes/heart.tscn")
const attack = preload("res://scenes/battle_scenes/core_attack_patern.tscn")
# Called when the node enters the scene tree for the first time.
var block = 0

func _ready():
	var enemy = enemy.instantiate()
	enemy.global_position = Vector2(550,300)
	add_child(enemy) # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	if block == 0:
		var attack = attack.instantiate()
		add_child(attack)
		block = 1 # Replace with function body.
