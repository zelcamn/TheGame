extends Node

signal body_entered(body: Callable)
signal item_pick(res: Resource)

signal item_delete(index: int)
signal item_add(res: Resource, index: int)
signal item_interact(item: Object)
signal item_unequip(res: Resource)

signal attack_is_pressed()
