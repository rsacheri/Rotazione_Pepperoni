extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# _play_tomato_animation()
	$tomatoSplat.visible = false
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _play_tomato_animation():
	$tomatoSplat.visible = true
	$%tomatoSplat.play("default")
