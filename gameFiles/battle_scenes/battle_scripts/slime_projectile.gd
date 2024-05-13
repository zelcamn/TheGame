extends CharacterBody2D


var slime_attack_damage = 10
@export var speed = 400
var direction: Vector2

#var direction = Vector2(1,0)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var collision = move_and_collide(direction*speed*delta)
	if collision:
		var collider = collision.get_collider()
		if collider.has_method("hit"):
			if collider.hit(slime_attack_damage) <= 0:
				EventBus.emit_signal("player_is_dead")
		queue_free()
		#del()


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free() # Replace with function body.
