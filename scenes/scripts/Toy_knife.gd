extends PickableItems

func _ready():
  var Equipment = PickableItems.new()

  Equipment.setItemStats("Toy knife", 10.1, 0) #Название, урон, хп

  add_child(Equipment)
