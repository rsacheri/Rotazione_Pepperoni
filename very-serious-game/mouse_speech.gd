extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_hide_bubble()


## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass

# wait function
func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout

func _show_bubble():
	$speechBubbles.visible = true

func _hide_bubble():
	$speechBubbles.visible = false

func _perfect():
	_show_bubble()
	$speechBubbles.frame = 0
	await wait(0.75)
	_hide_bubble()

func _good():
	_show_bubble()
	$speechBubbles.frame = 1
	await wait(0.75)
	_hide_bubble()

func _okay():
	_show_bubble()
	$speechBubbles.frame = 2
	await wait(0.75)
	_hide_bubble()


func _on_bear_perfect() -> void:
	_perfect()


func _on_bear_good() -> void:
	_good()


func _on_bear_okay() -> void:
	_okay()
