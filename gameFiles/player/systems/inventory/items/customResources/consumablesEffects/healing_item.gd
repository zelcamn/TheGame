extends Item
class_name healingItem

@export var health_restored: int

func interact(body: Object):
	GlobalInfo.set_player_hp(GlobalInfo.get_player_hp() + health_restored)
