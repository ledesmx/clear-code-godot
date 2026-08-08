extends Node2D

@export var direction := Vector2.RIGHT
var speed = 300

func _process(delta: float) -> void:
	position += direction * speed * delta
