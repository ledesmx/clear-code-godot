extends Node2D

var direction = Vector2(0,0)
var speed = 5
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	direction = Vector2(randf_range(-1, 1), randf_range(-1, 1))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Icon.position += direction * speed
	if $Icon.position.x < 0 + 64 or $Icon.position.x > 1152 - 64:
		direction.x *= -1
	if $Icon.position.y < 0 + 64 or $Icon.position.y > 648 - 64:
		direction.y *= -1
