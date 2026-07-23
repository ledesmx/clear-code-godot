extends Area2D

var textures = [
	preload("res://graphics/cars/green.png"),
	preload("res://graphics/cars/red.png"),
	preload("res://graphics/cars/yellow.png")
]

var direction = Vector2.LEFT
var speed = 140

func _ready() -> void:
	if position.x < 0:
		direction = Vector2.RIGHT
		$Sprite2D.flip_h = true
	$Sprite2D.texture = textures.pick_random()

func _process(delta: float) -> void:
	position.x += direction.x * speed * delta


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
