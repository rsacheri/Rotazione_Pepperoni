extends Node

@export var pizza_scene: PackedScene

var pizza_object
var numIngredients = 1

signal newOrder

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize() # randomize the seed
	
	_new_order(numIngredients)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

############################################################
# 							throw 
############################################################
# throw ingredient onto pizza
func _on_bear_throw() -> void:
	if($%bear._is_holding_tomato()):
		_throw_and_clear()
		pizza_object._add_sauce()
	elif($%bear._is_holding_cheese()):
		_throw_and_clear()
		pizza_object._add_cheese()
	elif($%bear._is_holding_pepperoni()):
		_throw_and_clear()
		pizza_object._add_pepperoni()
	elif($%bear._is_holding_sausage()):
		_throw_and_clear()
		pizza_object._add_sausage()
	elif($%bear._is_holding_pineapple()):
		_throw_and_clear()
		pizza_object._add_pineapple()

# throw animation and clear inventory
func _throw_and_clear():
	$%bear._throw_animation()
	$%bear._clear_inventory()


############################################################
# 						check/verify 
############################################################

# check if ingredient bear is holding
# is one of the needed ingredients (no duplicated allowed)
func _check_ingredient():
	var heldIngredient = $%bear._check_inventory()
	
	for x in Global.orderCopy:
		if (x == heldIngredient):
			Global.orderCopy.remove_at(int(x))
			return true

# returns true if built pizza matches order
func _check_order() -> bool:
	if (pizza_object != null):
		var order = pizza_object._check_toppings()
		
		order.sort()
		Global.order.sort()
		
		if (order != null):
			if (order == Global.order):
				return true
	else:
		# await wait(0.25)
		pass
	
	return false


############################################################
# 							order 
############################################################
# generate order
func _generate_order(num_ingredients : int):	
	Global.order.clear()
	
	var ingredients_copy = Global.ingredients.duplicate(true) 
	
	var i = 0
	var randInt
	var random_ingredient
	
	while (i < num_ingredients): 
		randInt = randi() % ingredients_copy.size()
		random_ingredient = ingredients_copy[randInt]
		Global.order.append(random_ingredient)
		ingredients_copy.remove_at(randInt)
		i += 1
	
	Global.orderCopy = Global.order.duplicate(true) 
	
	for x in Global.order:
		print(x)
	
	newOrder.emit()

# generate a new order
func _new_order(numIngredients : int):
	await wait(0.75)
	
	pizza_object = pizza_scene.instantiate()
	
	add_child(pizza_object)
	
	pizza_object.position = Vector2(620, 170)
	
	_generate_order(numIngredients)


############################################################
# 					general features 
############################################################
# wait function
func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout

# button presses
func _input(event):
	var orderCompleted
	
	# submit order
	if event.is_action_pressed("submit") && (pizza_object != null):
		if ($%bear.rotation_degrees >= (19 + (360 * $%bear._get_num_rotations()))) && ($%bear.rotation_degrees <= (55 + (360 * $%bear._get_num_rotations()))):
			orderCompleted = _check_order()
			if (orderCompleted):
				print("order complete!")
				Global.numOrdersCompleted += 1
				Global.score += Global.tempScore
			else:
				print("wrong order")
			Global.tempScore = 0
			pizza_object.queue_free()
			_new_order(numIngredients)
	
	# throw out pizza
	if event.is_action_pressed("trash_pizza"):
		if (pizza_object != null):
			pizza_object.queue_free()
			_new_order(numIngredients)

# grabbing ingredients
func _on_bear_grab() -> void:
	if (_check_ingredient()):
		$%bear._increase_temp_score(1)
