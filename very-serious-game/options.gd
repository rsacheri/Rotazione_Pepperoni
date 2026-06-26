extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Music.play_music()
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event):
	if event.is_action_pressed("enter"):
				get_tree().change_scene_to_file("res://starting_screen.tscn")
