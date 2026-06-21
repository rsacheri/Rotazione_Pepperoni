extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$%sauce.hide()
	$%cheese.hide()
	$%pepperoni.hide()
	$%sausage.hide()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


# add toppings
func _add_sauce():
	$%sauce.show()

func _add_cheese():
	$%cheese.show()

func _add_pepperoni():
	$%pepperoni.show()

func _add_sausage():
	$%sausage.show()
