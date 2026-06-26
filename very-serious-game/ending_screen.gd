extends Control

var index = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	index = 0
	$music.play()
	


# retry
func _on_retry_pressed() -> void:
	get_tree().change_scene_to_file("res://starting_screen.tscn")


# exit game
func _on_exit_pressed() -> void:
	get_tree().quit()


# button presses
func _input(event):
	if event.is_action_pressed("up"):
		$optionSFX.play()
		if (index != 0):
			index = 0
		else:
			index = 1
		$endingMenu.frame = index
	
	if event.is_action_pressed("down"):
		$optionSFX.play()
		if (index != 1):
			index = 1
		else:
			index = 0
		$endingMenu.frame = index
	
	if event.is_action_pressed("trash_pizza") || event.is_action_pressed("enter"):
		$optionSFX.play()
		if (index == 0):
			get_tree().change_scene_to_file("res://starting_screen.tscn")
		else:
			get_tree().quit()
