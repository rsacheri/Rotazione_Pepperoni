extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_on_main_new_order()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_main_new_order() -> void:
	# text = "%s\n%s\n%s" % Global.order[0], Global.order[1], Global.order[2]
	text = "%s" % Global.numOrdersCompleted
