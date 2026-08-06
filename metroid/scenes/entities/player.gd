extends CharacterBody2D

var speed := 100
@export var gravity = 9.8
@export var jump_strength = 500
var is_reloading = false


signal shoot(position: Vector2, direction: Vector2)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot") and not is_reloading:
		print("shoot")
		shoot.emit(position, Input.get_vector("aim left", "aim right", "aim up", "aim down").normalized())
		is_reloading = true
		$ReloadTimer.start()

func _physics_process(delta: float) -> void:
	var direction_x := Input.get_axis("left", "right")
	velocity.x = direction_x * speed
	
	if Input.is_action_just_pressed("jump"):
		velocity.y -= jump_strength
	
	# gravity
	velocity.y += gravity
	move_and_slide()
	


#func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	#if event.is_action("shoot") and not is_reloading:
		#print("shoot")
		#is_reloading = true


func _on_reload_timer_timeout() -> void:
	is_reloading = false
