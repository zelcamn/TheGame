extends Node2D

var attackFinished : bool
# Called when the node enters the scene tree for the first time.
func _ready():
	$Button.set_position(Vector2(960,540))
	EventBus.connect("attack_is_finished", finish_sign) # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if_finished()


func _on_button_pressed():
	attackFinished = true # Replace with function body.
	
func finish_sign():
	attackFinished = false

func if_finished():
	if attackFinished:
		get_tree().change_scene_to_file("res://gameFiles/battle_scenes/test_1.tscn")
		attackFinished = false
