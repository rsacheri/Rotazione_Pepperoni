extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global._set_initial_values()


# start game
func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")


# exit game
func _on_exit_pressed() -> void:
	get_tree().quit()
