extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

  
# Called every frame. 'delta' is the elapsed time since the previous frame. 
func _process(delta): 
	if Input.is_action_just_pressed("ui_accept"):
		GlobalInfo.reset_coldowns()
		#GlobalInfo.current_player_health = GlobalInfo.get_player_hp()
		get_tree().change_scene_to_file("res://gameFiles/battle_scenes/test_1.tscn")
