extends CharacterBody2D

var speed := 100
@export var gravity = 9.8
@export var jump_strength = 500

func _physics_process(delta: float) -> void:
	var direction_x := Input.get_axis("left", "right")
	velocity.x = direction_x * speed
	
	if Input.is_action_just_pressed("jump"):
		velocity.y -= jump_strength
	
	# gravity
	velocity.y += gravity
	move_and_slide()
	
