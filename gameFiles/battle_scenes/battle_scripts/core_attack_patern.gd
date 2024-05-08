extends Node2D

#const slash_line_scene = preload("res://scenes/sword.tscn")
const slash_line_scene = preload("res://gameFiles/battle_scenes/slash_line.tscn")

#параметры вызова атак
#@export var line := [[Vector2(350,550),0,Vector2(1,0)],[Vector2(365,220),35,Vector2(1.15,0.85)],
#[Vector2(1550,220),145,Vector2(-1.3,0.85)]] #в теории можно наполнять из вне
@export var line : Array
var attack_count = 0

var newAttack :bool

func _ready():
	EventBus.connect("attack_is_pressed", attack_sign)

func _process(delta):
	if newAttack and attack_count <= line.size()-1:
		create_slash_line(line[attack_count][0],line[attack_count][1],line[attack_count][2])
		newAttack = false
		attack_count += 1

func attack_sign():
	newAttack = true
	
func create_slash_line(pos,rot,dir):
	
	var slash_line = slash_line_scene.instantiate()
	slash_line.global_position = pos #позиция
	slash_line.rotation_degrees = rot #угол поворота
	slash_line.direction = dir #направление (можно суммировать векторы)

	add_child(slash_line) 

	

