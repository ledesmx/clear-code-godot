extends CharacterBody2D

var speed := 100

func _physics_process(delta: float) -> void:
	var direction_x := Input.get_axis("left", "right")
	velocity.x = direction_x * speed
	
	if Input.is_action_just_pressed("jump"):
		velocity.y -= 500
	
	# gravity
	velocity.y += 9.8
	move_and_slide()
	
