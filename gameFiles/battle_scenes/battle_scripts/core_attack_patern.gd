extends Node2D

#const slash_line_scene = preload("res://scenes/sword.tscn")
const slash_line_scene = preload("res://gameFiles/battle_scenes/slash_line.tscn")


@export var line : Array
var attack_count : int

var newAttack :bool
var turnFinished : bool

func _ready():
	EventBus.connect("attack_is_pressed", attack_sign)
	attack_count = 0
	#EventBus.connect("turn_is_finished", finish_sign)

func _process(delta):
	if newAttack and attack_count <= line.size()-1:
		create_slash_line(line[attack_count][0],line[attack_count][1],line[attack_count][2])
		newAttack = false
		attack_count += 1
	elif attack_count > line.size()-1 and newAttack:
		attack_count = 0
		print(attack_count)
		print("end")
		newAttack = false
		EventBus.emit_signal("player_turn_is_finished")

func attack_sign():
	newAttack = true


func create_slash_line(pos,rot,dir):
	
	var slash_line = slash_line_scene.instantiate()
	slash_line.global_position = pos #позиция
	slash_line.rotation_degrees = rot #угол поворота
	slash_line.direction = dir #направление (можно суммировать векторы)

	add_child(slash_line) 

	

