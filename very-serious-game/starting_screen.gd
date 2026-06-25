extends Control

var index = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global._set_initial_values()


# start game
func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")


# exit game
func _on_exit_pressed() -> void:
	get_tree().quit()


# button presses
func _input(event):
	if event.is_action_pressed("up"):
		if (index > 0):
			index -= 1
		else:
			index = 2
		$mainMenu.frame = index
	
	if event.is_action_pressed("down"):
		if (index < 2):
			index += 1
		else:
			index = 0
		$mainMenu.frame = index
	
	if event.is_action_pressed("enter"):
		if (index == 0):
			get_tree().change_scene_to_file("res://main.tscn")
		elif (index == 1):
			pass
		else:
			get_tree().quit()
