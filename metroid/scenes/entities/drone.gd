extends CharacterBody2D

var attack_player := false
var player_position := Vector2.ZERO

func _physics_process(delta: float) -> void:
	if attack_player:
		var total_velocity = sqrt((velocity.x ** 2) + (velocity.y ** 2))
		velocity +=  (player_position - position).normalized() * 4
		velocity = velocity.limit_length(100)
		move_and_slide()
	if Input.is_action_just_pressed("explote"):
		play_explosion()

func _on_area_2d_body_entered(body: Node2D) -> void:
	attack_player = true
	print("Player detected")
	
func play_explosion():
	$BodySprite2D.visible = false
	$ExplosionSprite2D.visible = true
	$AnimationPlayer.play("explosion_animation")
