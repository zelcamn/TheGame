extends Item
class_name GetPlayerWeapon

func interact(body: Object):
	print(GlobalInfo.get_player_weapon())
