extends Node

signal body_entered(body: Callable)
signal item_pick(res: Resource)

signal item_delete(index: int)
signal item_add(res: Resource, index: int)
signal item_interact(item: Object)
signal item_unequip(res: Resource)

signal attack_is_pressed()
signal player_turn_is_finished()
signal mob_turn_is_finished()
signal projectile_is_denied()
signal damage_is_taken()

signal enemy_is_dead()
signal player_is_dead()

signal battle_is_begin()
signal open_world_is_begin()
