extends CharacterBody2D

var speed := 100
@export var gravity = 9.8
@export var jump_strength = 500
var is_reloading = false


signal shoot(position: Vector2, direction: Vector2)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot") and not is_reloading:
		print("shoot")
		var shoot_direction = Input.get_vector("aim left", "aim right", "aim up", "aim down").normalized()
		if shoot_direction == Vector2.ZERO:
			shoot_direction = Vector2.RIGHT
		shoot.emit(position, shoot_direction)
		is_reloading = true
		$ReloadTimer.start()

func _physics_process(delta: float) -> void:
	var direction_x := Input.get_axis("left", "right")
	velocity.x = direction_x * speed
	set_current_animation(direction_x)
	
	if Input.is_action_just_pressed("jump"):
		velocity.y -= jump_strength
	
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
	match [shoot_direction.x, shoot_direction.y]:
		[var x, _] when x > .75:
			$TorsoSprite2D.frame = 0
		[var x, var y] when x > .25 and y < -.25:
			$TorsoSprite2D.frame = 7
		[var x, var y] when x > .25 and y > .25:
			$TorsoSprite2D.frame = 1
		[_, var y] when y < -.75:
			$TorsoSprite2D.frame = 6
		[_, var y] when y > .75:
			$TorsoSprite2D.frame = 2
		[var x, var y] when x > -.75 and y < -.25:
			$TorsoSprite2D.frame = 5
		[var x, var y] when x > -.75 and y > .25:
			$TorsoSprite2D.frame = 3
		[var x, _] when x < -.75:
			$TorsoSprite2D.frame = 4
