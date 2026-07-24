extends CharacterBody2D

var direction := Vector2.ZERO
const WALK_SPEED := 30
const RUN_SPEED := 60
var speed := WALK_SPEED

func _physics_process(_delta: float) -> void:
	direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	animate()
	move_and_slide()
	if Input.is_action_just_pressed("run"):
		speed = RUN_SPEED
	if Input.is_action_just_released("run"):
		speed = WALK_SPEED

func animate():
	if direction:
		if abs(direction.x) > abs(direction.y):
			$AnimatedSprite2D.animation = "right" if direction.x > 0 else "left"
		else:
			$AnimatedSprite2D.animation = "down" if direction.y > 0 else "up"
	else:
		$AnimatedSprite2D.frame = 0
