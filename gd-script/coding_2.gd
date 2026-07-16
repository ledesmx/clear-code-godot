extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Sprite2D.rotate(3.0 * delta)
	$Sprite2D.position.x += 3
	$Sprite2D.position.y += 1
	$Sprite2D.scale.x += .2 * delta
	$Sprite2D.scale.y += .2 * delta
