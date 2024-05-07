extends Node2D

#const slash_line_scene = preload("res://scenes/sword.tscn")
const slash_line_scene = preload("res://scenes/battle_scenes/slash_line.tscn")

#параметры вызова атак
@export var line := [[Vector2(350,550),0,Vector2(1,0)],[Vector2(365,220),35,Vector2(1.15,0.85)],
[Vector2(1550,220),145,Vector2(-1.3,0.85)]] #в теории можно наполнять из вне

func _ready():
	for i in line:
		if GlobalInfo.enemy_is_dead == 0:
			var sl = slash_line_scene.instantiate()
			create_slash_line(i[0],i[1],i[2])
			await get_tree().create_timer(1).timeout #цикл повторяется через секунду, меч успевает подойди к краю экрана
			#не критично, но можно доработать
		else:
			break
		

func create_slash_line(pos,rot,dir):
	
	var slash_line = slash_line_scene.instantiate()
	slash_line.global_position = pos #позиция
	slash_line.rotation_degrees = rot #угол поворота
	slash_line.direction = dir #направление (можно суммировать векторы)

	add_child(slash_line) 

	

