extends CharacterBody2D

var direction := Vector2.ZERO
var speed := 100

func _physics_process(_delta: float) -> void:
	direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()
	if Input.is_action_just_pressed("print_something"):
		speed = 160
	if Input.is_action_just_released("print_something"):
		speed = 100
