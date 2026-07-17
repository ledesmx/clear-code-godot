extends Node2D

var direction := Vector2.ZERO
var speed := 10

func _physics_process(delta: float) -> void:
	position += direction * speed
