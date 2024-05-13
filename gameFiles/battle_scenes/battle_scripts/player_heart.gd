extends CharacterBody2D

@export var hp : attack_component

var health = Health.new()

var speed = GlobalInfo.playerSpeed * 2
# Called when the node enters the scene tree for the first time.
func _ready():
	if !GlobalInfo.current_player_health:
		GlobalInfo.current_player_health = GlobalInfo.playerHealth
	else:
		GlobalInfo.current_player_health = 5
	#GlobalInfo.current_mob_health = GlobalInfo.slimeHealth
	health.maxHealth = GlobalInfo.playerHealth
	#health.health = GlobalInfo.slimeHealth
	health.health = GlobalInfo.current_player_health


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
		
	position += velocity * delta

func hit(attack_damage):
	#hp.damage(health.health,dmg)
	hp.damage(health.health,attack_damage)
	print("Current health: " + str(health.health))
	
	#health.health = hp.damage(health.health,dmg)
	health.health = hp.damage(health.health,attack_damage) #нанесение урона и возвращение хп
	#print("Taken " + str(dmg) + " damage")
	print("Health after damage: " + str(health.health) +"\n")
	return health.health
