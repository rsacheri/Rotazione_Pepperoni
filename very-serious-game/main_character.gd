extends Node2D

@export var numRotations = 0

@export var holdingItem = false

@export var holdingTomato = false
@export var holdingCheese = false
@export var holdingPepperoni = false
@export var holdingSausage = false
@export var holdingPineapple = false

@export var spinSpeed = 2

signal grab
signal throw

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$%bear.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotation += spinSpeed * delta	#s spin to win
	#print(rotation_degrees)
	#pass


# on button press
func _input(event):
	numRotations = int(rotation_degrees) / 360
	
	if event.is_action_pressed("grab"):
		if (!holdingItem):
			_grab_ingredient_selection(numRotations)
			
	if event.is_action_pressed("throw"):
		if (holdingItem):
			_throw_item(numRotations)
			
	if event.is_action_pressed("trash"):
		if (holdingItem):
			_trash_item(numRotations)


############################################################
# 							throw 
############################################################
# throw item
func _throw_item(numRotations : int):
	if (rotation_degrees >= (-18 + (360 * numRotations))) && (rotation_degrees <= (18 + (360 * numRotations))):
		throw.emit()

# throw animation
func _throw_animation():
	$%bear.play("throw")


############################################################
# 							grab 
############################################################
# grab ingredient
func _grab_ingredient_selection(numRotations : int) -> void:
	if (!holdingItem):
		#grab sauce
		if (rotation_degrees >= (90 + (360 * numRotations))) && (rotation_degrees <= (125 + (360 * numRotations))):
			_grab_tomato()
		
		#grab cheese
		if (rotation_degrees >= (126 + (360 * numRotations))) && (rotation_degrees <= (161 + (360 * numRotations))):
			_grab_cheese()
		
		# grab pepperoni
		if (rotation_degrees >= (162 + (360 * numRotations))) && (rotation_degrees <= (197 + (360 * numRotations))):
			_grab_pep()
		
		# grab sausage
		if (rotation_degrees >= (198 + (360 * numRotations))) && (rotation_degrees <= (233 + (360 * numRotations))):
			_grab_sausage()
		
		# grab pineapple
		if (rotation_degrees >= (234 + (360 * numRotations))) && (rotation_degrees <= (270 + (360 * numRotations))):
			_grab_pineapple()


############################################################
# 					grab ingredients 
############################################################
func _grab_tomato():
	print("grabbed sauce!")
	holdingItem = true
	holdingTomato = true
	$%bear.play("pickUp")
	grab.emit()

func _grab_cheese():
	print("grabbed cheese!")
	holdingItem = true
	holdingCheese = true
	$%bear.play("pickUp")
	grab.emit()

func _grab_pep():
	print("grabbed pepperoni!")
	holdingItem = true
	holdingPepperoni = true
	$%bear.play("pickUp")
	grab.emit()

func _grab_sausage():
	print("grabbed sausage!")
	holdingItem = true
	holdingSausage = true
	$%bear.play("pickUp")
	grab.emit()

func _grab_pineapple():
	print("grabbed pineapple!")
	holdingItem = true
	holdingPineapple = true
	$%bear.play("pickUp")
	grab.emit()


func _increase_temp_score(n : int):
	Global.tempScore += n


#func _grab_ingredient(numRotations : int) -> void:
	#var ingredients = ["sauce", "cheese", "pepperoni", "sausage", "pineapple"]
	#
	#var table_start = 90
	#var table_end = 270
	#
	#var section_deg = (table_end - table_start) / (ingredients.size())
	#
	#var curr_angle = fmod(rotation_degrees, 360)
	#
	#if ((curr_angle <= table_start) || (curr_angle >= table_end)):
		#return
	#
	#var table_angle = curr_angle - table_start
	#
	#var section_id = floor(table_angle / section_deg)
	#
	#var score_val = 1 - abs((((table_angle / section_deg) - section_id) - 0.5) * 2)
	#
	#score_val *= 3
	#
	#if (score_val > 0.8):
		#Global.score = 3
	#elif (score_val > 0.5):
		#Global.score = 2
	#else:
		#Global.score = 1

func _trash_item(numRotations : int):
	if (rotation_degrees >= (300 + (360 * numRotations))) && (rotation_degrees <= (335 + (360 * numRotations))):
		$%bear.play("throw")
		_clear_inventory()
		print("trashed item")

############################################################
# 					inventory management
############################################################
# check if holding item 
func _is_holding_tomato() -> bool:
	return holdingTomato

func _is_holding_cheese() -> bool:
	return holdingCheese

func _is_holding_pepperoni() -> bool:
	return holdingPepperoni

func _is_holding_sausage() -> bool:
	return holdingSausage

func _is_holding_pineapple() -> bool:
	return holdingPineapple

func _get_num_rotations():
	return numRotations

# get rid of what you're holding
func _clear_inventory():
	holdingItem = false
	holdingTomato = false
	holdingCheese = false
	holdingPepperoni = false
	holdingSausage = false
	holdingPineapple = false

# check what item you're holding
func _check_inventory():
	if holdingTomato:
		return "tomato"
	elif holdingCheese:
		return "cheese"
	elif holdingPepperoni:
		return "pepperoni"
	elif holdingSausage:
		return "sausage"
	elif holdingPineapple:
		return "pineapple"
