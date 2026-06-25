extends Node2D

var toppings = []

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
	toppings.append("tomato")

func _add_cheese():
	$%cheese.show()
	toppings.append("cheese")

func _add_pepperoni():
	$%pepperoni.show()
	toppings.append("pepperoni")

func _add_sausage():
	$%sausage.show()
	toppings.append("sausage")

func _add_pineapple():
	$%pineapple.show()
	toppings.append("pineapple")


# check what's on the pizza
func _check_toppings():
	
	
	#if ($%tomato.visible):
		#toppings.append("tomato")
	#if ($%cheese.visible):
		#toppings.append("tomato")
	#if ($%pepperoni.visible):
		#toppings.append("pepperoni")
	#if ($%sausage.visible):
		#toppings.append("sausage")
	#if ($%pineapple.visible):
		#toppings.append("pineapple")
	
	return toppings
