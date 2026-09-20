extends CharacterBody2D

var attack_player := false
var player_position := Vector2.ZERO
var attack_direction := Vector2.ZERO
var life := 3

signal explote(direction: Vector2)

func _ready() -> void:
	$AnimatedSprite2D.material = $AnimatedSprite2D.material.duplicate()

func _physics_process(_delta: float) -> void:
	if attack_player:
		attack_direction = (player_position - position).normalized()
		velocity +=  attack_direction * 4
		velocity = velocity.limit_length(100)
		move_and_slide()


func play_explosion():
	$AttackArea2D.set_deferred("monitoring", false)
	$PointLight2D.set_deferred("enabled", false)
	$AnimatedSprite2D.visible = false
	$CollisionShape2D.set_deferred("disabled", true)
	$ExplosionSprite2D.visible = true
	$AnimationPlayer.play("explosion_animation")
	$ExplotionAudioStreamPlayer2D.play()
	await $AnimationPlayer.animation_finished
	queue_free()
	
func chain_reaction():
	for drone in get_tree().get_nodes_in_group("Drones"):
		if position.distance_to(drone.position) < 30:
			drone.play_explosion()
	


func _on_detect_player_area_2d_body_entered(_body: Node2D) -> void:
	follow_and_attack()

func follow_and_attack():
	attack_player = true
	$PointLight2D.energy = 0.6


func _on_attack_area_2d_body_entered(body: Node2D) -> void:
	print(body.name)
	if body.is_in_group("Drones"):
		print(body.name)
	else:
		play_explosion()
		$AttackArea2D/CollisionShape2D.set_deferred("disabled", true)
		explote.emit(attack_direction)


func _on_detect_bullet_area_2d_area_entered(_area: Area2D) -> void:
	life -= 1
	if life == 0:
		play_explosion()
	else:
		var tween = create_tween()
		tween.tween_property($AnimatedSprite2D.material, "shader_parameter/Progress", 0.5, 0.0)
		tween.tween_interval(0.1)
		tween.tween_property($AnimatedSprite2D.material, "shader_parameter/Progress", 1, 0.0)
		
		if life < 3:
			follow_and_attack()
