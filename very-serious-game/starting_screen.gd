extends Control

@export var music: PackedScene

var index = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global._set_initial_values()
	index = 0
	
	Music.play_music()

func _play_music():
	#$music.play()
	Music.play_music()


# start game
func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://cutscene.tscn")


# exit game
func _on_exit_pressed() -> void:
	get_tree().quit()


# button presses
func _input(event):
	if event.is_action_pressed("up"):
		$optionSFX.play()
		if (index > 0):
			index -= 1
		else:
			index = 2
		$mainMenu.frame = index
	
	if event.is_action_pressed("down"):
		$optionSFX.play()
		if (index < 2):
			index += 1
		else:
			index = 0
		$mainMenu.frame = index
	
	if event.is_action_pressed("enter"):
		$optionSFX.play()
		if (index == 0):
			get_tree().change_scene_to_file("res://cutscene.tscn")
		elif (index == 1):
			get_tree().change_scene_to_file("res://options.tscn")
		else:
			get_tree().quit()
