extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_main_new_order() -> void:
	# text = "%s\n%s\n%s" % Global.order[0], Global.order[1], Global.order[2]
	text = "Orders Completed: %s" % Global.numOrdersCompleted
