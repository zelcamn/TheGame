extends Node2D

const slash_line_scene = preload("res://scenes/sword.tscn")
@export var line : sword

@export var attack_count := 1 #кол-во атак 

func _ready():
	create_slash_line(Vector2(0,350),0, Vector2.RIGHT) #подгрузка первого меча
	attack_count-=1

#проверка остановился ли меч, если да, то создать новый (от кол-ва атак)
func if_attack():
	if GlobalInfo.attack_is_pressed==1 and attack_count>0 and GlobalInfo.enemy_is_dead==0:
		create_slash_line(Vector2(0,350),0, Vector2.RIGHT + Vector2(0,0))
		#print(GlobalInfo.enemy_is_dead)
		attack_count-=1 #
		GlobalInfo.attack_is_pressed = 0
		
#проверка удалился ли меч, если да, то создать новый (от кол-ва атак)
func if_deleted():
	if GlobalInfo.line_is_deleted == 1 and attack_count>0:
		create_slash_line(Vector2(0,350),0, Vector2.RIGHT + Vector2(0,0))
		attack_count-=1 #
		GlobalInfo.line_is_deleted = 0
	

func _process(delta):
	if_attack()
	if_deleted()
	#if GlobalInfo.attack_is_pressed==1 and cnt>0 and GlobalInfo.enemy_is_dead==0:
		#create_slash_line(Vector2(0,350),0, Vector2.RIGHT + Vector2(0,0))
		##print(GlobalInfo.enemy_is_dead)
		#cnt-=1 #
		#GlobalInfo.attack_is_pressed = 0
		#
	#elif GlobalInfo.line_is_deleted == 1 and cnt>0:
		#create_slash_line(Vector2(0,350),0, Vector2.RIGHT + Vector2(0,0))
		#cnt-=1 #
		#GlobalInfo.line_is_deleted = 0

#добавление меча на сцену(позиция, угол поворота, направление (можно суммировать векторы))
func create_slash_line(pos:Vector2,rot,dir:Vector2):
	
	var slash_line = slash_line_scene.instantiate()
		
	slash_line.global_position = pos #позиция
	slash_line.rotation_degrees = rot #угол поворота
	slash_line.direction = dir #направление (можно суммировать векторы)
	if GlobalInfo.enemy_is_dead == 0:
		add_child(slash_line) 

