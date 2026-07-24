extends CharacterBody2D

var direction := Vector2.ZERO
const WALK_SPEED := 30
const RUN_SPEED := 60
var speed := WALK_SPEED
var fatigue := false

func _physics_process(_delta: float) -> void:
	direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	animate()
	move_and_slide()
	if Input.is_action_just_pressed("run") and not fatigue:
		speed = RUN_SPEED
		print("run")
		$RunTimer.start()


func animate():
	if direction:
		if abs(direction.x) > abs(direction.y):
			$AnimatedSprite2D.animation = "right" if direction.x > 0 else "left"
		else:
			$AnimatedSprite2D.animation = "down" if direction.y > 0 else "up"
	else:
		$AnimatedSprite2D.frame = 0


func _on_run_timer_timeout() -> void:
	speed = WALK_SPEED
	fatigue = true
	print(fatigue)
	$RunWaitTimer.start()


func _on_run_wait_timer_timeout() -> void:
	fatigue = false
	print(fatigue)
