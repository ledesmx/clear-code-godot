extends Node2D

@export var direction := Vector2.RIGHT
var speed = 100

func _ready() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property($".", "scale", Vector2.ONE, 0.1).from(Vector2.ZERO)

func _process(delta: float) -> void:
	position += direction * speed * delta
