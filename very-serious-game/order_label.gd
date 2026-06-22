extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


# display the order text
func _on_main_new_order() -> void:
	text = "%s" % _array_to_string(Global.order)


# convert order to string, with each ingredient on a new line
func _array_to_string(arr: Array) -> String:
	var s = ""
	for i in arr:
		s += String(i) + "\n"
	return s
