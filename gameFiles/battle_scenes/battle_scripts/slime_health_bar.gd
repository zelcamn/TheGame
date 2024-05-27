extends Node2D


func _ready():
	#set_health_bar() # Replace with function body.
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	set_health_bar()
	set_health_label()

func set_health_bar():
	$TextureProgressBar.max_value = GlobalInfo.slimeHealth
	$TextureProgressBar.value = GlobalInfo.current_mob_health
	
func set_health_label():
	$Label.text = "%s" %GlobalInfo.current_mob_health + "/%s"  %GlobalInfo.slimeHealth
