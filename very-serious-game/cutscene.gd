extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Music.stop_music()
	var tween = get_tree().create_tween()
	$music.play()
	$AnimatedSprite2D.play()
	tween.tween_property($ColorRect, "modulate:a", 0, 2)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (!$AnimatedSprite2D.is_playing()):
		_transition()

func _transition():
	var tween = get_tree().create_tween()
	tween.tween_property($ColorRect, "modulate:a", 100, 3)
	get_tree().change_scene_to_file("res://how_to_play.tscn")

# wait function
func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout


func _input(event):
	# submit order
	if event.is_action_pressed("trash_pizza") || event.is_action_pressed("enter"):
		get_tree().change_scene_to_file("res://how_to_play.tscn")
