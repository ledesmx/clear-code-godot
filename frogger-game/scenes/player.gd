extends Node2D

var direction := Vector2.ZERO
var speed := 10

func _physics_process(delta: float) -> void:
	direction = Input.get_vector("left", "right", "up", "down")
	position += direction * speed
