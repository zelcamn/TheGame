extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	#set_health_bar() # Replace with function body.
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	set_health_bar()

func set_health_bar():
	$HealthBar.max_value = GlobalInfo.playerHealth
	$HealthBar.value = GlobalInfo.current_player_health
