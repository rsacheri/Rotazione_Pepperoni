extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# print("changes saved")
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


# throw ingredient onto pizza
func _on_bear_throw() -> void:
	if($%bear._is_holding_tomato()):
		$pizza._add_sauce()
	elif($%bear._is_holding_cheese()):
		$pizza._add_cheese()
	elif($%bear._is_holding_pepperoni()):
		$pizza._add_pepperoni()
	elif($%bear._is_holding_sausage()):
		$pizza._add_sausage()
