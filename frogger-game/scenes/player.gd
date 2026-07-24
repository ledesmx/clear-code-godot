extends CharacterBody2D

var direction := Vector2.ZERO
var speed := 30

func _physics_process(_delta: float) -> void:
	direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	animate()
	move_and_slide()
	if Input.is_action_just_pressed("print_something"):
		speed *= 2
	if Input.is_action_just_released("print_something"):
		speed /= 2

func animate():
	if direction:
		if abs(direction.x) > abs(direction.y):
			$AnimatedSprite2D.animation = "right" if direction.x > 0 else "left"
		else:
			$AnimatedSprite2D.animation = "down" if direction.y > 0 else "up"
	else:
		$AnimatedSprite2D.frame = 0
