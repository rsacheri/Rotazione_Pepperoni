extends Node

# difficulty
var spinSpeed = 2.0
var numIngredients = 3
var numSpinsMultiplier = 5

# scoring and lives
var numSpins = 0
var numSpinsToWin = 15
var lives = 3
var score = 0
var tempScore = 0
var tempTempScore = 0
var numOrdersCompleted = 0

# order
var ingredients = ["tomato", "cheese", "pepperoni", "sausage", "pineapple"]
var order = []
var orderCopyGrab = []
var orderCopyThrow = []


# reset values for retry
func _set_initial_values():
	spinSpeed = 100.0
	numIngredients = 1
	numSpinsMultiplier = 5
	
	numSpins = 0
	numSpinsToWin = 15
	lives = 3
	score = 0
	tempScore = 0
	tempTempScore = 0
	numOrdersCompleted = 0
	
	order.clear()
	orderCopyGrab.clear()
	orderCopyThrow.clear()
