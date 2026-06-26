extends Node2D

@export var holdingItem = false

@export var holdingTomato = false
@export var holdingCheese = false
@export var holdingPepperoni = false
@export var holdingSausage = false
@export var holdingPineapple = false

var rotationCompleted = false
var previousRotation

signal grab
signal throw
signal spin

signal perfect
signal good
signal okay

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_clear_inventory()
	$%bear.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	previousRotation = rotation_degrees
	
	rotation_degrees += Global.spinSpeed * delta	# spin to win
	rotation_degrees = fmod(rotation_degrees, 360)
	
	
	if (previousRotation > rotation_degrees):
		# print("spin")
		print(Global.numSpins)
		Global.numSpins += 1
		spin.emit()
	
	#print(fmod(rotation_degrees, 360))
	# if (is_equal_approx(fmod(rotation_degrees, 360), 0)):
	# if (fmod(rotation_degrees, 360) == 0):
	#if ((int)(rotation_degrees) % 360 == 0):
		#print("spin")
		#Global.numSpins = int(rotation_degrees) / 360
		#spin.emit()
		
	#print(rotation_degrees)
	#pass


# on button press
func _input(event):
	
	if event.is_action_pressed("grab"):
		if (!holdingItem):
			_grab_ingredient_selection()
			
	if event.is_action_pressed("throw"):
		if (holdingItem):
			_throw_item()
			
	if event.is_action_pressed("trash"):
		if (holdingItem):
			_trash_item()


############################################################
# 							throw 
############################################################
# throw item
func _throw_item():
	if (rotation_degrees >= 342) || (rotation_degrees <= 18):
		$throwsfx.play()
		throw.emit()
		_throw_score()

# throw animation
func _throw_animation():
	$%bear.play("default")


############################################################
# 							grab 
############################################################
# grab ingredient
func _grab_ingredient_selection() -> void:
	if (!holdingItem):
		#grab sauce
		if (rotation_degrees >= 90) && (rotation_degrees <= 125):
			_grab_ingredient_score()
			_grab_tomato()
			
		
		#grab cheese
		if (rotation_degrees >= 126) && (rotation_degrees <= 161):
			_grab_ingredient_score()
			_grab_cheese()
			
		
		# grab pepperoni
		if (rotation_degrees >= 162) && (rotation_degrees <= 197):
			_grab_ingredient_score()
			_grab_pep()
			
		
		# grab sausage
		if (rotation_degrees >= 198) && (rotation_degrees <= 233):
			_grab_ingredient_score()
			_grab_sausage()
			
		
		# grab pineapple
		if (rotation_degrees >= 234) && (rotation_degrees <= 270):
			_grab_ingredient_score()
			_grab_pineapple()
			


############################################################
# 					grab ingredients 
############################################################
func _grab_tomato():
	print("grabbed sauce!")
	holdingItem = true
	holdingTomato = true
	$%bear.animation = "pickUp"
	$%bear.frame = 0
	grab.emit()

func _grab_cheese():
	print("grabbed cheese!")
	holdingItem = true
	holdingCheese = true
	$%bear.animation = "pickUp"
	$%bear.frame = 1
	grab.emit()

func _grab_pep():
	print("grabbed pepperoni!")
	holdingItem = true
	holdingPepperoni = true
	$%bear.animation = "pickUp"
	$%bear.frame = 2
	grab.emit()

func _grab_sausage():
	print("grabbed sausage!")
	holdingItem = true
	holdingSausage = true
	$%bear.animation = "pickUp"
	$%bear.frame = 3
	grab.emit()

func _grab_pineapple():
	print("grabbed pineapple!")
	holdingItem = true
	holdingPineapple = true
	$%bear.animation = "pickUp"
	$%bear.frame = 4
	grab.emit()


func _increase_temp_score():
	Global.tempScore += Global.tempTempScore


func _grab_ingredient_score() -> void:
	var table_start = 90
	var table_end = 270
	
	var section_deg = (table_end - table_start) / (Global.ingredients.size())
	
	var curr_angle = fmod(rotation_degrees, 360)
	
	if ((curr_angle <= table_start) || (curr_angle >= table_end)):
		return
	
	var table_angle = curr_angle - table_start
	
	var section_id = floor(table_angle / section_deg)
	
	var score_val = 1 - abs((((table_angle / section_deg) - section_id) - 0.5) * 2)
	
	score_val *= 3
	
	Global.tempTempScore = 0
	
	if (score_val > 0.85):
		$perfectsfx.play()
		perfect.emit()
		#$mouseSpeech._perfect()
		Global.tempTempScore += 3
	elif (score_val > 0.5):
		$goodsfx.play()
		good.emit()
		#$mouseSpeech._good()
		Global.tempTempScore += 2
	else:
		$okaysfx.play()
		okay.emit()
		#$mouseSpeech._okay()
		Global.tempTempScore += 1

func _throw_score() -> void:
	var curr_angle = fmod(rotation_degrees, 360)
	
	var table_start = -18
	
	var table_angle = curr_angle - table_start
	
	var section_id = floor(table_angle / 36)
	
	var score_val = 1 - abs((((table_angle / 36) - section_id) - 0.5) * 2)
	
	score_val *= 3
	
	# Global.tempTempScore = 0
	
	if (score_val > 0.85):
		#$mouseSpeech._perfect()
		perfect.emit()
		Global.tempScore += 3
		print("Throw Score: 3")
	elif (score_val > 0.5):
		good.emit()
		#$mouseSpeech._good()
		Global.tempScore += 2
		print("Throw Score: 2")
	else:
		okay.emit()
		#$mouseSpeech._okay()
		Global.tempScore += 1
		print("Throw Score: 1")


func _trash_item():
	if (rotation_degrees >= 300) && (rotation_degrees <= 335):
		$%bear.play("default")
		_clear_inventory()
		Global.tempTempScore = 0
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


############################################################
# 							spin 
############################################################
# get number of rotations
func _get_num_rotations():
	return (int(rotation_degrees) / 360)

# get rotation degree
func _get_rotation_degrees() -> float:
	return rotation_degrees

# reset rotation degrees
func _reset_rotation_degrees():
	rotation_degrees = 0
