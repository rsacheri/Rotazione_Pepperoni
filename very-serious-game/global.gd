extends Node

var lives = 3
var score = 0
var tempScore = 0
var tempTempScore = 0
var numOrdersCompleted = 0
var ingredients = ["tomato", "cheese", "pepperoni", "sausage", "pineapple"]
var order = []
var orderCopyGrab = []
var orderCopyThrow = []


# reset values for retry
func _set_initial_values():
	lives = 3
	score = 0
	order.clear()
	orderCopyGrab.clear()
	orderCopyThrow.clear()
	numOrdersCompleted = 0
