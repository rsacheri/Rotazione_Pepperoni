extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# _play_tomato_animation()
	$tomatoSprite.visible = false
	$cheeseSprite.visible = false
	$pepperoniSprite.visible = false
	$sausageSprite.visible = false
	$pineappleSprite.visible = false
	
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _play_tomato_animation():
	$tomatoSprite.visible = true
	$%tomatoSprite.play("whole")

func _play_cheese_animation():
	$cheeseSprite.visible = true
	$%cheeseSprite.play("whole")

func _play_pepperoni_animation():
	$pepperoniSprite.visible = true
	$%pepperoniSprite.play("whole")

func _play_sausage_animation():
	$sausageSprite.visible = true
	$%sausageSprite.play("whole")

func _play_pineapple_animation():
	$pineappleSprite.visible = true
	$%pineappleSprite.play("whole")
