extends Node2D

@export var direction := Vector2.RIGHT
var speed = 100

func _process(delta: float) -> void:
	position += direction * speed * delta
