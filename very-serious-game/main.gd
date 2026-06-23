extends Node

@export var pizza_scene: PackedScene

var pizza_object

signal newOrder

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize() # randomize the seed
	Global._set_initial_values() # reset global values
	
	_new_order()
	
	await wait(0.75)
	#_lost_life()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

############################################################
# 							throw 
############################################################
# throw ingredient onto pizza
func _on_bear_throw() -> void:
	if (_check_ingredient_throw()):
		print("Throw Score: ", Global.tempTempScore)
		Global.tempScore += Global.tempTempScore
		Global.tempTempScore = 0
	
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
func _check_ingredient_throw():
	var heldIngredient = $%bear._check_inventory()
	
	for x in Global.orderCopyThrow:
		if (x == heldIngredient):
			Global.orderCopyThrow.remove_at(int(x))
			return true

# check if ingredient bear is holding
# is one of the needed ingredients (no duplicated allowed)
func _check_ingredient_grab():
	var heldIngredient = $%bear._check_inventory()
	
	for x in Global.orderCopyGrab:
		if (x == heldIngredient):
			Global.orderCopyGrab.remove_at(int(x))
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
func _generate_order():	
	Global.order.clear()
	
	var ingredients_copy = Global.ingredients.duplicate(true) 
	
	var i = 0
	var randInt
	var random_ingredient
	
	while (i < Global.numIngredients): 
		randInt = randi() % ingredients_copy.size()
		random_ingredient = ingredients_copy[randInt]
		Global.order.append(random_ingredient)
		ingredients_copy.remove_at(randInt)
		i += 1
	
	Global.orderCopyGrab = Global.order.duplicate(true) 
	Global.orderCopyThrow = Global.order.duplicate(true) 
	
	for x in Global.order:
		print(x)
	
	newOrder.emit()

# generate a new order
func _new_order():
	await wait(0.75)
	
	pizza_object = pizza_scene.instantiate()
	
	add_child(pizza_object)
	
	pizza_object.position = Vector2(620, 170)
	
	_generate_order()


############################################################
# 						lives
############################################################
func _lost_life():
	var temp
	
	Global.lives -= 1
	
	# end game if 0 lives
	if (Global.lives == 0):
		$lives._set_frame(Global.lives)
		set_block_signals(true)
		Global.spinSpeed = 0
		await wait(2)
		get_tree().change_scene_to_file("res://ending_screen.tscn")
	# change frame to reflect number of lives
	else:
		$lives._set_frame(Global.lives)
		set_block_signals(true)
		temp = Global.spinSpeed
		Global.spinSpeed = 0
		await wait(0.75)
		Global.spinSpeed = temp


############################################################
# 					difficulty
############################################################
# increase difficulty
func _increase_difficulty():
	if (Global.numOrdersCompleted % 5 == 0):
		_incread_spin_speed()
	if (Global.numOrdersCompleted % 10 == 0 && Global.numIngredients <= 5):
		_increase_num_ingredients()

# increase spin speed every 5 correct orders
func _incread_spin_speed():
	Global.spinSpeed += 0.33

# increase number of toppings
func _increase_num_ingredients():
	Global.numIngredients += 1


############################################################
# 					general features 
############################################################
# wait function
func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout

func _move_pizza():
	var tween = create_tween()
	pizza_object.position = Vector2(953, 163)
	tween.tween_property(pizza_object, "position", Vector2(953, -125), 0.5)

# button presses
func _input(event):
	var orderCompleted
	
	# submit order
	if event.is_action_pressed("submit") && (pizza_object != null):
		if ($%bear.rotation_degrees >= (19 + (360 * $%bear._get_num_rotations()))) && ($%bear.rotation_degrees <= (55 + (360 * $%bear._get_num_rotations()))):
			orderCompleted = _check_order()
			if (orderCompleted):
				_move_pizza()
				print("order complete!")
				Global.numOrdersCompleted += 1
				Global.score += Global.tempScore
				_increase_difficulty()
			else:
				print("wrong order")
				_lost_life()
			
			await wait(0.75)
			Global.tempScore = 0
			pizza_object.queue_free()
			
			if (Global.lives != 0):
				_new_order()
	
	# throw out pizza
	if event.is_action_pressed("trash_pizza"):
		if (pizza_object != null):
			_lost_life()
			pizza_object.queue_free()
			if (Global.lives != 0):
				_new_order()

# grabbing ingredients
func _on_bear_grab() -> void:
	if (_check_ingredient_grab()):
		print("Grab Score: ", Global.tempTempScore)
		$%bear._increase_temp_score()
		Global.tempTempScore = 0
