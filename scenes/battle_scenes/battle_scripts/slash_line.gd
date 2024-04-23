extends CharacterBody2D

@export var speed = 800
var direction: Vector2
# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	PressAttack()
	var collision = move_and_collide(direction*speed*delta)
	if collision:
		var collider = collision.get_collider()
		if collider.has_method("hit"):
			if collider.hit() <= 0:
				GlobalInfo.enemy_is_dead = 1
		#del()


func PressAttack():
	if Input.is_action_just_pressed("ui_accept"):
		get_node("CollisionShape2D").disabled = false
		#queue_free()
		del()

func del():
	queue_free()
func _on_visible_on_screen_notifier_2d_screen_exited():
	#queue_free()
	del()
