extends CharacterBody2D

@export var speed = 10
var screenSize
var health = Health.new()
var inventory = Inventory.new()

#var IsanimationChosen: bool
# Called when the node enters the scene tree for the first time.
func _ready():
	EventBus.connect("item_interact", item_interact)
	EventBus.connect("item_pick", add_item)
	EventBus.connect("item_delete", item_delete)
	EventBus.connect("item_unequip", item_unequip)
	
	screenSize = get_viewport_rect().size
	
	health.maxHealth = GlobalInfo.playerHealth
	if !GlobalInfo.current_player_health:
		health.health = GlobalInfo.playerHealth
		GlobalInfo.current_player_health = GlobalInfo.playerHealth
	else:
		health.health = GlobalInfo.current_player_health
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity = Vector2.ZERO
	if Input.is_action_pressed("moveDown"):
		#if not IsanimationChosen:
		$PlayerSprite.animation = "down"
		#IsanimationChosen = true
		velocity.y += 1
	elif Input.is_action_pressed("moveUp"):
		#if not IsanimationChosen:
		$PlayerSprite.animation = "up"
		#IsanimationChosen = true
		velocity.y -= 1
	elif Input.is_action_pressed("moveLeft"):
		#if not IsanimationChosen:
		$PlayerSprite.flip_h = false
		$PlayerSprite.animation = "side"
		#IsanimationChosen = true
		velocity.x -= 1
	elif Input.is_action_pressed("moveRight"):
		#if not IsanimationChosen:
		$PlayerSprite.flip_h = true
		$PlayerSprite.animation = "side"
		#IsanimationChosen = true
		velocity.x += 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$PlayerSprite.play()
	else:
		$PlayerSprite.stop()
		$PlayerSprite.frame = 0
		#IsanimationChosen = false
	
	move_and_slide()
	#position += velocity * delta
	#position = position.clamp(Vector2.ZERO, screenSize)

func add_item(item: Resource, index: int):
	inventory.append(item, index)
	$inventory_UI.add_item_UI(item, index)

func item_delete(index):
	inventory.pop(index)

func item_interact(item: Object):
	if item.resource.type == 0:
		item.resource.interact(self)
		item.delete_self()
	elif item.resource.type == 1:
		var item_in_slot = inventory.assign_weapon(item.id)
		if item_in_slot != null:
			add_item(item_in_slot, GlobalInfo.get_new_id())
		$inventory_UI.add_item_in_slot_UI(item.resource)
		item.delete_self()
	elif item.resource.type == 2:
		var item_in_slot = inventory.assign_armor(item.id)
		if item_in_slot != null:
			add_item(item_in_slot, GlobalInfo.get_new_id())
		$inventory_UI.add_item_in_slot_UI(item.resource)
		item.delete_self()

func item_unequip(res: Resource):
	if res.type == 1:
		add_item(res, GlobalInfo.get_new_id())
		inventory.weapon = null
	if res.type == 2:
		add_item(res, GlobalInfo.get_new_id())
		inventory.armor = null

func _on_body_entered(body):
	if body.has_method("is_active"):
		body.call("is_active")


func _on_body_exited(body):
	if body.has_method("is_active"):
		body.call("is_active")
