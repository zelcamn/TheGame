extends CharacterBody2D

@export var hp : attack_component

@onready var axis = Vector2.ZERO

var health = Health.new()

var speed = GlobalInfo.playerSpeed * 2
var acceleration = 15000
var friction = 12000
# Called when the node enters the scene tree for the first time.
func _ready():
	#if !GlobalInfo.current_player_health:
	#	GlobalInfo.current_player_health = GlobalInfo.playerHealth

	#GlobalInfo.current_mob_health = GlobalInfo.slimeHealth
	health.maxHealth = GlobalInfo.playerHealth
	#health.health = GlobalInfo.slimeHealth
	health.health = GlobalInfo.current_player_health
	#health.health = GlobalInfo.get_player_hp()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move(delta)
	
func get_input_velocity():
	axis.x = int(Input.is_action_pressed("moveRight")) - int(Input.is_action_pressed("moveLeft"))
	axis.y = int(Input.is_action_pressed("moveDown")) - int(Input.is_action_pressed("moveUp"))
	return axis.normalized()

func move(delta):
	axis = get_input_velocity()
	
	if axis == Vector2.ZERO:
		apply_friction(friction*delta)
	else:
		apply_movement(axis * acceleration * delta)
	move_and_slide()

func apply_friction(amount):
	if velocity.length() > amount:
		velocity -= velocity.normalized() * amount
		
	else:
		velocity = Vector2.ZERO

func apply_movement(accel):
	velocity += accel
	velocity = velocity.limit_length(speed)

func hit(attack_damage):
	#hp.damage(health.health,dmg)
	hp.damage(health.health,attack_damage)
	print("Current health: " + str(health.health))
	#GlobalInfo.set_player_hp(health.health - attack_damage)
	#health.health = hp.damage(health.health,dmg)
	health.health = hp.damage(health.health,attack_damage) #нанесение урона и возвращение хп
	GlobalInfo.current_player_health = health.health
	#print("Taken " + str(dmg) + " damage")
	print("Health after damage: " + str(health.health) +"\n")
	return health.health
