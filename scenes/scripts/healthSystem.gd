extends Object

class_name Health

signal ChangedHP

var minHealth: int = 0:
	set(newMinHealth):
		minHealth = newMinHealth
var maxHealth: int = 1:
	set(newMaxHealth):
		maxHealth = newMaxHealth
var health: int = 0:
	set(newHealth):
		health = clamp(newHealth, minHealth, maxHealth)
		emit_signal("changedHP", health)
	get:
		return health
