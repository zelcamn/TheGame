extends CharacterBody2D

@export var hp : attack_component

@onready var axis = Vector2.ZERO

var health = Health.new()

var speed = GlobalInfo.playerSpeed * 2
var acceleration = 15000
var friction = 12000

var damage_is_taken : bool
var block_damage : bool

@onready var block_timer = $Timer
# Called when the node enters the scene tree for the first time.
func _ready():

	EventBus.connect("damage_is_taken", damage_is_taken_sign)
	health.maxHealth = GlobalInfo.playerHealth
	health.health = GlobalInfo.current_player_health



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move(delta)
	hit_coldown()
	
func hit_coldown():
	if damage_is_taken and block_damage == false:
		GlobalInfo.has_no_timers = false
		block_damage = true
		block_timer.start()
		GlobalInfo.sprite_flash($AnimatedSprite2D)
		damage_is_taken = false
		
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
	
	#hp.damage(health.health,attack_damage)
	
	EventBus.emit_signal("damage_is_taken")
	
	print("Current health: " + str(health.health))
	
	if !block_damage and GlobalInfo.player_shield < 1:
		health.health = hp.damage(health.health,attack_damage) #нанесение урона и возвращение хп
		
	if GlobalInfo.player_shield > 0:
		GlobalInfo.player_shield -= 1
	
	GlobalInfo.current_player_health = health.health
	
	print("Health after damage: " + str(health.health) +"\n")
	
	return health.health
	
func damage_is_taken_sign():
	damage_is_taken = true


func _on_timer_timeout():
	block_damage = false 
	GlobalInfo.has_no_timers = true# Replace with function body.
	

