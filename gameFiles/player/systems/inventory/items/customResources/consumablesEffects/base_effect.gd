extends Item
class_name baseEffect

func interact(body: Object):
	#run_effect(body.get("testM"))
	pass

func run_effect(message: String):
	print(message)
