extends Node2D

var direction := Vector2.ZERO
var speed := 2

func _physics_process(_delta: float) -> void:
	direction = Input.get_vector("left", "right", "up", "down")
	position += direction * speed
	if Input.is_action_just_pressed("print_something"):
		print("Something")
