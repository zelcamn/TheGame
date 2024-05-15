extends CharacterBody2D


var slime_attack_damage = 10
@export var speed = 800
var direction: Vector2
@onready var timer = $Timer

var start = false
#var direction = Vector2(1,0)
# Called when the node enters the scene tree for the first time.
func _ready():
	timer.start() # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if start:
		await get_tree().create_timer(0.25).timeout
		$AnimatedSprite2D.visible = true
		var collision = move_and_collide(direction*speed*delta)
		if collision:
			var collider = collision.get_collider()
			if collider.has_method("hit"):
				if collider.hit(slime_attack_damage) <= 0:
					EventBus.emit_signal("player_is_dead")
			queue_free() # Replace with function body.
		
			#del()


func _on_visible_on_screen_notifier_2d_screen_exited():
	delete_projectiles()# Replace with function body.

func delete_projectiles():
	queue_free()
	EventBus.emit_signal("projectile_is_denied")


func _on_timer_timeout():
	$Sprite2D.visible = false
	start = true
