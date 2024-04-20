extends Area2D

var speed = GlobalInfo.playerSpeed
var screenSize
var health = Health.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	screenSize = get_viewport_rect().size
	
	health.maxHealth = GlobalInfo.playerHealth
	health.health = GlobalInfo.playerHealth


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("moveDown"):
		velocity.y += 1
	if Input.is_action_pressed("moveUp"):
		velocity.y -= 1
	if Input.is_action_pressed("moveLeft"):
		velocity.x -= 1
	if Input.is_action_pressed("moveRight"):
		velocity.x += 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$PlayerSprite.animation = "walk"
		$PlayerSprite.play()
	else:
		$PlayerSprite.animation = "stop"
		$PlayerSprite.stop()
	
	position += velocity * delta
	#position = position.clamp(Vector2.ZERO, screenSize)
