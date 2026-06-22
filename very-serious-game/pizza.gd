extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$%tomato.hide()
	$%cheese.hide()
	$%pepperoni.hide()
	$%sausage.hide()
	$%pineapple.hide() 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

############################################################
# 						add toppings 
############################################################
func _add_sauce():
	$%tomato.show()

func _add_cheese():
	$%cheese.show()

func _add_pepperoni():
	$%pepperoni.show()

func _add_sausage():
	$%sausage.show()

func _add_pineapple():
	$%pineapple.show()


# check what's on the pizza
func _check_toppings():
	var toppings = []
		
	if ($%tomato.visible):
		toppings.append("tomato")
	if ($%cheese.visible):
		toppings.append("cheese")
	if ($%pepperoni.visible):
		toppings.append("pepperoni")
	if ($%sausage.visible):
		toppings.append("sausage")
	if ($%pineapple.visible):
		toppings.append("pineapple")
	
	return toppings
