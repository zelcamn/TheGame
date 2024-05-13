extends Node2D

const player_heart_scene = preload("res://gameFiles/battle_scenes/player_heart.tscn")
const slime_projectile_scene = preload("res://gameFiles/battle_scenes/slime_projectile.tscn")
# Called when the node enters the scene tree for the first time.
var player_is_dead : bool

func _ready():
	EventBus.connect("player_is_dead", player_is_dead_sign)
	var player_heart = player_heart_scene.instantiate()
	player_heart.global_position = Vector2(960,540)
	add_child(player_heart) 
	

func _process(delta):
	if player_is_dead:
		get_tree().quit()
	if Input.is_action_just_pressed("ui_accept"):
		var i = 0
		while i < 2000:
			create_slime_projectile(Vector2(50+i,0),-90,Vector2(0,1))
			i += 200 
# Called every frame. 'delta' is the elapsed time since the previous frame.

func create_slime_projectile(pos,rot,dir):
	
	var slime_projectile = slime_projectile_scene.instantiate()
	slime_projectile.global_position = pos #позиция
	slime_projectile.rotation_degrees = rot #угол поворота
	slime_projectile.direction = dir #направление (можно суммировать векторы)

	add_child(slime_projectile) 
	
func player_is_dead_sign():
	player_is_dead = true

