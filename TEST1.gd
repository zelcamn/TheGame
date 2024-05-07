extends Node2D

const enemy = preload("res://scenes/battle_scenes/heart.tscn")
const attack = preload("res://scenes/battle_scenes/core_attack_patern.tscn")
# Called when the node enters the scene tree for the first time.
var block = 0

func _ready():
	var enemy = enemy.instantiate()
	#enemy.scale = Vector2(10,10)
	enemy.global_position = Vector2(960,600)
	add_child(enemy) # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_attack_x1_pressed():
	if block == 0:
		var attack = attack.instantiate()
		attack.line = [[Vector2(960,200),90,Vector2(0,1)]]
		#attack.scale = Vector2(2,2)
		add_child(attack)
		#$"Attack x1".release_focus()
		$"Attack x1".disabled = true
		$"Attack x3".disabled = true
		block = 1 # Replace with function body.


func _on_attack_x_3_pressed():
	if block == 0:
		var attack = attack.instantiate()
		attack.line = [[Vector2(350,550),0,Vector2(1,0)],[Vector2(365,220),35,Vector2(1.15,0.85)],
[Vector2(1550,220),145,Vector2(-1.3,0.85)]]
		#attack.scale = Vector2(2,2)
		add_child(attack)
		#$"Attack x1".release_focus()
		$"Attack x1".disabled = true
		$"Attack x3".disabled = true
		block = 1  # Replace with function body.


 # Replace with function body.
