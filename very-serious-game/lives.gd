extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$livesSprite.frame = 3	# set to full lives


# set the animation frame to n
func _set_frame(n : int):
	$livesSprite.frame = n
