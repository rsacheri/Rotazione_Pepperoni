extends Control

@onready var orderLabel = $orderLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# orderLabel._array_to_string()
	_hide_ingredients()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _hide_ingredients():
	$%tomato.visible = false
	$%cheese.visible = false
	$%pepperoni.visible = false
	$%sausage.visible = false
	$%pineapple.visible = false
	

func _match_order_to_picture():
	_hide_ingredients()
	
	#print("")
	
	for i in Global.order:
		if (i == "tomato"):
			#print("tomato")
			#$%VBoxContainer.move_child($%VBoxContainer.get_child(0), index)
			$%tomato.move_to_front()
			$%tomato.visible = true
		elif (i == "cheese"):
			#print("cheese")
			$%cheese.move_to_front()
			$%cheese.visible = true
		elif (i == "pepperoni"):
			#print("pepperoni")
			$%pepperoni.move_to_front()
			$%pepperoni.visible = true
		elif (i == "sausage"):
			#print("sausage")
			$%sausage.move_to_front()
			$%sausage.visible = true
		elif (i == "pineapple"):
			#print("pineapple")
			$%pineapple.move_to_front()
			$%pineapple.visible = true
	
