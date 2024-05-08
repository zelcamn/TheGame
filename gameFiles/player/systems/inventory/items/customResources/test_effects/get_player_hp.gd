extends Item
class_name GetPlayerHP

func interact(body: Object):
	print(GlobalInfo.get_player_hp())
