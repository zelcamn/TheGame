extends Node2D

const player_heart_scene = preload("res://gameFiles/battle_scenes/player_heart.tscn")
const slime_projectile_scene = preload("res://gameFiles/battle_scenes/slime_projectile.tscn")
const slime_projectile_2_scene = preload("res://gameFiles/battle_scenes/slime_projectile_2.tscn")
# Called when the node enters the scene tree for the first time.
var player_is_dead : bool
var projectile_is_denied : bool
var attackFinished : bool


@onready var timer = $Timer

func _ready():
	GlobalInfo.current_player_health = 100
	
	
	timer.start()
	EventBus.connect("attack_is_finished", finish_sign)
	EventBus.connect("projectile_is_denied", projectile_is_denied_sign)
	EventBus.connect("player_is_dead", player_is_dead_sign)
	var player_heart = player_heart_scene.instantiate()
	player_heart.global_position = Vector2(960,700)
	add_child(player_heart) 
	

func _process(delta):
	if player_is_dead:
		get_tree().quit()
	if_finished()
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _on_timer_timeout():
	var patern = randi_range(1,2)
	if patern == 1:
		slime_attack_patern_1()
	elif patern == 2: # Replace with function body.
		slime_attack_patern_2()
	pass

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
	finish_sign()
	#if_finished()
	#projectile_is_denied = false
	
func slime_attack_patern_2():
	var i=0	
	#while i < 820:
		#var j=0
		#while j < 400:
			#create_slime_projectile_2(Vector2(randf_range(480+i,600+i),randf_range(500+j,540+j)),0)
			#j+= 50
		#i += 164
	while i < 80:
		create_slime_projectile_2(Vector2(randf_range(480,1420),randf_range(500,940)),0)
		i += 1
	await get_tree().create_timer(2.5).timeout
	finish_sign()
	#create_slime_projectile_2(Vector2(1420,500),0)
	#create_slime_projectile_2(Vector2(480,940),0)

func player_is_dead_sign():
	player_is_dead = true

func projectile_is_denied_sign():
	projectile_is_denied = true
	
func finish_sign():
	attackFinished = true

func if_finished():
	await get_tree().create_timer(0.5).timeout
	if attackFinished and GlobalInfo.has_no_timers == true:
		get_tree().change_scene_to_file("res://gameFiles/battle_scenes/test_1.tscn")
		attackFinished = false




