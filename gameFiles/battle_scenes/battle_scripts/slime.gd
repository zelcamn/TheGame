extends Node2D

var enemy_is_dead : bool
# Called when the node enters the scene tree for the first time.
func _ready():
	EventBus.connect("enemy_is_dead", enemy_dead_sign) # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if enemy_is_dead:
		$Sprite2D4.visible = false
		$Sprite2D3.visible = false
		$AnimatedSprite2D.visible = true
		$AnimatedSprite2D.play("default")
		enemy_is_dead = false
		
func enemy_dead_sign():
	enemy_is_dead = true
	GlobalInfo.current_mob_health = 0


func _on_animated_sprite_2d_animation_finished():
	#$AnimatedSprite2D.stop()
	print("SSSS")
	EventBus.emit_signal("change_scene")
	$Sprite2D4.visible = true
	$Sprite2D3.visible = true
	$AnimatedSprite2D.visible = false

