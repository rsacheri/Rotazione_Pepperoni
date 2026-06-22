extends Node


var selected_ingredients = []
var first_ingredient = ""
var second_ingredient = ""
var third_ingredient = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize() # randomize the seed
	
	_generate_order(3)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


# throw ingredient onto pizza
func _on_bear_throw() -> void:
	if($%bear._is_holding_tomato()):
		_throw_and_clear()
		$pizza._add_sauce()
	elif($%bear._is_holding_cheese()):
		_throw_and_clear()
		$pizza._add_cheese()
	elif($%bear._is_holding_pepperoni()):
		_throw_and_clear()
		$pizza._add_pepperoni()
	elif($%bear._is_holding_sausage()):
		_throw_and_clear()
		$pizza._add_sausage()
	elif($%bear._is_holding_pineapple()):
		_throw_and_clear()
		$pizza._add_pineapple()


# throw animation and clear inventory
func _throw_and_clear():
	$%bear._throw_animation()
	$%bear._clear_inventory()


# what does this even do?
func _check_ingredient():
	var heldIngredient = $%bear._check_inventory()
	
	for x in selected_ingredients:
		if (x == heldIngredient):
			selected_ingredients.remove_at(int(x))
			return true


# returns true if built pizza matches order
func _check_order() -> bool:
	var order = $%pizza._check_toppings()
	
	if (order != null):
		if (order == selected_ingredients):
			return true
	
	return false


# generate order
func _generate_order(num_ingredients : int):	
	selected_ingredients.clear()
	
	var ingredients_copy = Global.ingredients.duplicate(true) 
	
	var i = 0
	var randInt
	var random_ingredient
	
	while (i < num_ingredients): 
		randInt = randi() % ingredients_copy.size()
		random_ingredient = ingredients_copy[randInt]
		selected_ingredients.append(random_ingredient)
		ingredients_copy.remove_at(randInt)
		i += 1
	
	for x in selected_ingredients:
		print(x)
	


func _input(event):
	var orderCompleted
	
	if event.is_action_pressed("submit"):
		orderCompleted = _check_order()
		if (orderCompleted):
			print("order complete!")
		else:
			print("wrong order")
