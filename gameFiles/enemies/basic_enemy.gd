extends Node2D

var tween: Tween
var params = PhysicsRayQueryParameters2D.new()

@export var viewDistance = 10
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
	params.exclude = [self]
	$DetectCollisions/Detection.shape.set_radius(viewDistance)
	destinationPoint = transform.origin
	startPoint = transform.origin
	player = get_tree().get_nodes_in_group("Player")[0]
	homePoint = self.position

func _physics_process(delta):
	if moveDelta >= 1:
		timer += delta
	if isIdle == false:
		if isPlayerVisible():
			startPoint = transform.origin
			moveDelta = 0.0
			destinationPoint = get_pursue_point()
		else:
			pass
			#destinationPoint = get_patrol_point()
	else:
		pass
		#destinationPoint = get_patrol_point()
	#print(homePoint, destinationPoint, homePoint.distance_to(destinationPoint))
	if moveDelta < 1 or isIdle == false:
		travel(destinationPoint, delta)

func get_patrol_point() -> Vector2:
	var space = get_world_2d().direct_space_state
	var destination = destinationPoint
	if moveDelta >= 1 and timer >= waitTimer:
		moveDelta = 0.0
		timer = 0.0
		startPoint = transform.origin
		if startChanged:
			homePoint = startPoint
			startChanged = false
		var dirs = [0, 1, 2, 3, 4, 5, 6, 7]
		for i in range(8):
			destination = ((homePoint + Vector2(0, randf() * patrolDistance) )* Vector2.UP.rotated(dirs.pick_random() * 45)).clamp(homePoint - Vector2(patrolDistance, patrolDistance), homePoint + Vector2(patrolDistance, patrolDistance))
			params.set_from(transform.origin)
			params.set_to(destination)
			print(space.intersect_ray(params))
			if space.intersect_ray(params) == {}:
				break
	#params.set_from(transform.origin)
	#params.set_to(destination)
	#var result = space.intersect_ray(params)
	#if result == null:
	#	return destination
	return destination

func get_pursue_point() -> Vector2:
	if moveDelta >= 1:
		moveDelta = 0.0
		startPoint = transform.origin
	startChanged = true
	return player.position

func isPlayerVisible():
	var space = get_world_2d().direct_space_state
	params.set_from(transform.origin)
	params.set_to(player.position)
	var result = space.intersect_ray(params)
	if result.collider == player:
		return true
	return false
	

func travel(dest: Vector2, delta):
	#var distance = transform.origin.distance_to(dest)
	#var lerpTime = distance / speed
	#moveDelta += delta / lerpTime
	#translate(lerp(transform.origin, dest, moveDelta) - transform.origin)
	if transform.origin != dest:
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
