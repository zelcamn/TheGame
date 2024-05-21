extends CharacterBody2D

@onready var timer = $Timer
# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("new_animation") # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_animation_player_animation_finished(anim_name):
	$Area2D/Sprite2D.visible = true
	$AnimatedSprite2D.visible = false # Replace with function body.
	$Sprite2D2.visible = false 
	$Area2D/CollisionPolygon2D.disabled = false
	timer.start()


func _on_timer_timeout():
	queue_free() # Replace with function body.


func _on_area_2d_body_entered(body):
	if body.has_method("hit"):
		body.hit(GlobalInfo.slime_attack_damage)
		queue_free() # Replace with function body.
