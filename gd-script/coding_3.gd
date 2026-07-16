extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var direction = 1
var distance = 160
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Sprite2D.position.x += distance * direction * delta
	if $Sprite2D.position.x < 38:
		direction = 1
	if $Sprite2D.position.x > 900:
		direction = -1
