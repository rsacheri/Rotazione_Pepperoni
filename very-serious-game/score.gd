extends Label

# var score = Global.score

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_on_main_new_order()

# display score text
func _on_main_new_order() -> void:
	text = "%s" % Global.score
	# print("from on main new order")
