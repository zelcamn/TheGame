extends Resource
class_name Item

enum Type {consumable, weapon, armor}

@export var name: String
@export var texture: Texture
@export var type: Type

func interact(body: Object):
	pass
