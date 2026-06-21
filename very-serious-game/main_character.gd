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
	if event.is_action_pressed("grab"):
		numRotations = int(rotation_degrees) / 360
		
		if (holdingItem):
			_throw_item()
		else:
			_grab_ingredient()
			

func _throw_item():
	numRotations = int(rotation_degrees) / 360
	if (rotation_degrees >= (-18 + (360 * numRotations))) && (rotation_degrees <= (18 + (360 * numRotations))):
		$%bear.play("throw")
		throw.emit()
		holdingItem = false
		holdingTomato = false
		holdingCheese = false
		holdingPepperoni = false
		holdingSausage = false

func _grab_ingredient() -> void:
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


# check if holding item
func _is_holding_tomato() -> bool:
	return holdingTomato

func _is_holding_cheese() -> bool:
	return holdingCheese

func _is_holding_pepperoni() -> bool:
	return holdingPepperoni

func _is_holding_sausage() -> bool:
	return holdingSausage
