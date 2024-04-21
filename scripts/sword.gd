extends Area2D

class_name sword

@export var speed: int = 800
var direction: Vector2 = Vector2.RIGHT

#временное решение для остановки меча
var SwordIsMove = 1


func _process(delta):
	position += direction * speed * delta * SwordIsMove
	PressAttack()


#проверка попал ли хитбокс на хитбокс врага
func _on_body_entered(body):
	if "hit" in body:
		#body.hit()
		#GlobalInfo.enemy_is_dead = 1
		if body.hit() <= 0:
			GlobalInfo.enemy_is_dead = 1

	
#остановка меча + включение хитбокса
func PressAttack():
	if Input.is_action_just_pressed("ui_accept"):
		get_node("CollisionShape2D").disabled = false
		SwordIsMove = 0
		GlobalInfo.attack_is_pressed = 1
		#GlobalInfo.enemy_is_dead=1

#функция для удаления
func del():
	queue_free()
	GlobalInfo.line_is_deleted = 1
	#print("deleted " + str(GlobalInfo.line_is_deleted))

#удаление при выходе за экран
func _on_visible_on_screen_notifier_2d_screen_exited():
	del()
