extends Area2D


@export var speed: int = 300
var direction: Vector2 = Vector2.RIGHT

var BlockMove = 1

func _process(delta):
	position += direction * speed * delta * BlockMove
	PressAttack()


func _on_body_entered(body):
	if "hit" in body:
		body.hit()

func PressAttack():
	if Input.is_action_just_pressed("ui_accept"):
			get_node("CollisionShape2D").disabled = false
			BlockMove = 0



func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
