extends Node2D

var direction = Vector2(1, 0)

func _physics_process(delta: float) -> void:
	position += direction * 10
