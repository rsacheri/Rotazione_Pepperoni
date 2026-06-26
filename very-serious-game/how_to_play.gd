extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#await wait(15)
	#get_tree().change_scene_to_file("res://main.tscn")
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event):
	# submit order
	if event.is_action_pressed("trash_pizza") || event.is_action_pressed("enter"):
		get_tree().change_scene_to_file("res://main.tscn")


# wait function
func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
