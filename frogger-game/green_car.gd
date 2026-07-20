extends Area2D

var direction = Vector2.LEFT
var speed = 2

func _ready() -> void:
	if position.x < 0:
		direction = Vector2.RIGHT
		$Sprite2D.flip_h = true

func _process(delta: float) -> void:
	position.x += direction.x * speed


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
