extends Node2D

var is_now_open_world : bool
var is_now_battle : bool

const open_world_scene = preload("res://gameFiles/scenes/mainScene.tscn")
const battle_scene = preload("res://gameFiles/battle_scenes/test_1.tscn")

var open_world = open_world_scene.instantiate()
var battle = battle_scene.instantiate()
# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(open_world)
	EventBus.connect("open_world_is_begin", open_world_sign)
	EventBus.connect("battle_is_begin", battle_sign)
	#open_world = get_node("openWorld")
	#battle = get_node("TEST1")
	 # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_now_battle:
		remove_child(open_world)
		add_child(battle)
		is_now_battle = false
	if is_now_open_world:
		remove_child(battle)
		add_child(open_world)
		is_now_open_world = false
		
func battle_sign():
	is_now_battle = true
	
func open_world_sign():
	is_now_open_world = true
