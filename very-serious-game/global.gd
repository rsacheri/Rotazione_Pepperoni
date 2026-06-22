extends Node

var lives = 3
var score = 0
var ingredients = ["tomato", "cheese", "pepperoni", "sausage", "pineapple"]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _set_initial_values():
	lives = 3
	score = 0
