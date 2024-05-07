extends Node2D

var tween: Tween

@export var patrolDistance = 70
@export var speed: int = 1
@export var waitTimer = 3

var startChanged = false
var isIdle = true
var isReachedDest = false
var doAttack = false
var destinationPoint: Vector2
var player: Object
var homePoint: Vector2
var startPoint
var moveDelta = 0.0
var timer = 0.0

func _ready():
	destinationPoint = transform.origin + _random_inside_unit_circle()
	startPoint = transform.origin
	player = get_tree().get_nodes_in_group("Player")[0]
	homePoint = self.position

func _physics_process(delta):
	if moveDelta >= 1:
		timer += delta
	if isIdle == false:
		destinationPoint = get_pursue_point()
	else:
		destinationPoint = get_patrol_point()
	if moveDelta < 1 or isIdle == false:
		travel(destinationPoint, delta)

func get_patrol_point() -> Vector2:
	var result = destinationPoint
	if moveDelta >= 1 and timer >= waitTimer:
		moveDelta = 0.0
		timer = 0.0
		startPoint = transform.origin
		if startChanged:
			homePoint = startPoint
			startChanged = false
		result = homePoint + _random_inside_unit_circle() * patrolDistance
		
	return result

func get_pursue_point() -> Vector2:
	if moveDelta >= 1:
		moveDelta = 0.0
		startPoint = transform.origin
	startChanged = true
	return player.position

func travel(dest: Vector2, delta):
	#var distance = transform.origin.distance_to(dest)
	#var lerpTime = distance / speed
	#moveDelta += delta / lerpTime
	#translate(lerp(transform.origin, dest, moveDelta) - transform.origin)
	
	var distance = dest.distance_to(startPoint)
	var lerpTime = distance / speed
	moveDelta += delta / lerpTime
	var nextPoint = startPoint.lerp(dest, moveDelta)
	transform.origin = nextPoint

func attack(body: Object):
	print("attack!!!!")
	queue_free()

func is_player_entered_detection(body):
	print(player, "   ", body)
	if body == player:
		startPoint = transform.origin
		moveDelta = 0.0
		isIdle = false

func is_player_exited_detection(body):
	if body == player:
		isIdle = true

func is_player_entered_attack(body):
	print(body)
	if body == player:
		attack(body)

func _random_inside_unit_circle() -> Vector2:
	var theta = randf() * 2 * PI
	return Vector2(cos(theta), sin(theta)) * sqrt(randf())
