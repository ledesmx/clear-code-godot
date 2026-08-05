extends CharacterBody2D

var speed := 100

func _physics_process(delta: float) -> void:
	var direction := get_direction()
	velocity = direction * speed
	move_and_slide()

func get_direction() -> Vector2:
	if Input.is_action_pressed("right"):
		return Vector2.RIGHT
	elif Input.is_action_pressed("left"):
		return Vector2.LEFT
	
	return Vector2.ZERO
