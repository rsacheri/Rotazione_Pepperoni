extends Node2D

@export var numRotations = 0

@export var holdingItem = false

@export var holdingTomato = false
@export var holdingCheese = false
@export var holdingPepperoni = false
@export var holdingSausage = false

signal throw

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$%bear.play("default")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotation += 2 * delta	
	#print(rotation_degrees)
	#pass

func _input(event):
	numRotations = int(rotation_degrees) / 360
	
	if event.is_action_pressed("grab"):
		if (!holdingItem):
			_grab_ingredient(numRotations)
			
	if event.is_action_pressed("throw"):
		if (holdingItem):
			_throw_item(numRotations)
			
	if event.is_action_pressed("trash"):
		if (holdingItem):
			_trash_item(numRotations)

func _throw_item(numRotations : int):
	if (rotation_degrees >= (-18 + (360 * numRotations))) && (rotation_degrees <= (18 + (360 * numRotations))):
		$%bear.play("throw")
		throw.emit()
		_clear_inventory()

func _grab_ingredient(numRotations : int) -> void:
	#grab sauce
			if (rotation_degrees >= (90 + (360 * numRotations))) && (rotation_degrees <= (125 + (360 * numRotations))):
				if (!holdingItem):
					print("grabbed sauce!")
					holdingItem = true
					holdingTomato = true
					$%bear.play("pickUp")
			
			#grab cheese
			if (rotation_degrees >= (126 + (360 * numRotations))) && (rotation_degrees <= (161 + (360 * numRotations))):
				if (!holdingItem):
					print("grabbed cheese!")
					holdingItem = true
					holdingCheese = true
					$%bear.play("pickUp")
			
			# grab pepperoni
			if (rotation_degrees >= (162 + (360 * numRotations))) && (rotation_degrees <= (197 + (360 * numRotations))):
				if (!holdingItem):
					print("grabbed pepperoni!")
					holdingItem = true
					holdingPepperoni = true
					$%bear.play("pickUp")
			
			# grab sausage
			if (rotation_degrees >= (198 + (360 * numRotations))) && (rotation_degrees <= (233 + (360 * numRotations))):
				if (!holdingItem):
					print("grabbed sausage!")
					holdingItem = true
					holdingSausage = true
					$%bear.play("pickUp")
			
			# grab ???
			if (rotation_degrees >= (234 + (360 * numRotations))) && (rotation_degrees <= (270 + (360 * numRotations))):
				if (!holdingItem):
					print("grabbed ???!")
					holdingItem = true
					$%bear.play("pickUp")

func _trash_item(numRotations : int):
	if (rotation_degrees >= (300 + (360 * numRotations))) && (rotation_degrees <= (335 + (360 * numRotations))):
		$%bear.play("throw")
		_clear_inventory()
		print("trashed item")

# check if holding item
func _is_holding_tomato() -> bool:
	return holdingTomato

func _is_holding_cheese() -> bool:
	return holdingCheese

func _is_holding_pepperoni() -> bool:
	return holdingPepperoni

func _is_holding_sausage() -> bool:
	return holdingSausage


# get rid of what you're holding
func _clear_inventory():
	holdingItem = false
	holdingTomato = false
	holdingCheese = false
	holdingPepperoni = false
	holdingSausage = false
