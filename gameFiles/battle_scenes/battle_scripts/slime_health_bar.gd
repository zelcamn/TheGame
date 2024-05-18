extends Node2D


func _ready():
	#set_health_bar() # Replace with function body.
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	set_health_bar()

func set_health_bar():
	$health_bar.max_value = GlobalInfo.slimeHealth
	$health_bar.value = GlobalInfo.current_mob_health
