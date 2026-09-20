extends CharacterBody2D

var speed := 100
@export var gravity = 9.8
@export var jump_strength = 500
var is_reloading = false
var explosion_direction := Vector2.ZERO
var got_hit := false


signal shoot(position: Vector2, direction: Vector2)

func _process(delta: float) -> void:
	set_crosshair()
	if Input.is_action_just_pressed("shoot") and not is_reloading:
		print("shoot")
		var shoot_direction = Input.get_vector("aim left", "aim right", "aim up", "aim down").normalized()
		if shoot_direction == Vector2.ZERO:
			shoot_direction = Vector2.RIGHT
		shoot.emit(position, shoot_direction)
		$ShootAudioStreamPlayer2D.play()
		is_reloading = true
		$ReloadTimer.start()
		var tween = get_tree().create_tween()
		tween.tween_property($CrosshairSprite2D, "scale", Vector2(.2, .2), .1)
		tween.tween_property($CrosshairSprite2D, "scale", Vector2(.4, .4), .1)

func _physics_process(delta: float) -> void:
	if not got_hit:
		var direction_x := Input.get_axis("left", "right")
		velocity.x = direction_x * speed
		set_current_animation(direction_x)
	else:
		velocity.x = move_toward(velocity.x, 0, 10)
		if velocity.x == 0:
			got_hit = false
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y -= jump_strength
	
	if not explosion_direction.is_zero_approx():
		velocity += explosion_direction * 300
		explosion_direction = Vector2.ZERO
		got_hit = true
	# gravity
	velocity.y += gravity
	move_and_slide()

func _on_reload_timer_timeout() -> void:
	is_reloading = false
	
func set_current_animation(direction_x: float):
	$LegsSprite2D.flip_h = true if direction_x < 0.0 else false if direction_x > 0.0 else $LegsSprite2D.flip_h
	
	match [is_on_floor(), direction_x]:
		[false, _]:
			$LegsAnimationPlayer.current_animation = "jump"
		[true, 0.0]:
			$LegsAnimationPlayer.current_animation = "idle"
		[true, _]:
			$LegsAnimationPlayer.current_animation = "run"
	
	var shoot_direction = Input.get_vector("aim left", "aim right", "aim up", "aim down").normalized()
	match [int(round(shoot_direction.x)), int(round(shoot_direction.y))]:
		[1, 0]:
			$TorsoSprite2D.frame = 0
		[1, 1]:
			$TorsoSprite2D.frame = 1
		[0, 1]:
			$TorsoSprite2D.frame = 2
		[-1, 1]:
			$TorsoSprite2D.frame = 3
		[-1, 0]:
			$TorsoSprite2D.frame = 4
		[-1, -1]:
			$TorsoSprite2D.frame = 5
		[0, -1]:
			$TorsoSprite2D.frame = 6
		[1, -1]:
			$TorsoSprite2D.frame = 7

func set_crosshair():
	var shoot_direction = Input.get_vector("aim left", "aim right", "aim up", "aim down").normalized()
	$CrosshairSprite2D.position = shoot_direction * 50
