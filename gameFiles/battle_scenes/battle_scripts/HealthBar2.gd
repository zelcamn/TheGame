extends ProgressBar

# Called when the node enters the scene tree for the first time.
func _ready():
	set_health_bar() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_health_bar():
	$".".value = GlobalInfo.current_player_health
