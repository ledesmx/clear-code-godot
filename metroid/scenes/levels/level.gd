extends Node2D

var bullet_scene: PackedScene = preload("res://scenes/bullet.tscn")
@onready var player := $entities/Player
@onready var drones := get_tree().get_nodes_in_group("Drones")

func _ready() -> void:
	var light_tween := create_tween()
	light_tween.set_loops()
	light_tween.tween_property($Ligths/PointLight2D4, "enabled", false, 0.0)
	light_tween.tween_interval(2.5)
	light_tween.tween_property($Ligths/PointLight2D4, "enabled", true, 0.0)
	light_tween.tween_interval(.3)
	
	

func _process(delta: float) -> void:
	for drone in drones:
		if is_instance_valid(drone):
			drone.player_position = player.position

func _on_player_shoot(player_position: Vector2, direction: Vector2) -> void:
	print(player_position)
	print(direction)
	
	var bullet = bullet_scene.instantiate() as Node2D
	bullet.position = player_position + direction * 16
	bullet.direction = direction
	add_child(bullet)
	


func _on_drone_explote(direction: Vector2) -> void:
	player.explosion_direction = direction

func _on_drone_2_explote(direction: Vector2) -> void:
	player.explosion_direction = direction

func _on_drone_3_explote(direction: Vector2) -> void:
	player.explosion_direction = direction

func _on_drone_4_explote(direction: Vector2) -> void:
	player.explosion_direction = direction

func _on_drone_5_explote(direction: Vector2) -> void:
	player.explosion_direction = direction

func _on_drone_6_explote(direction: Vector2) -> void:
	player.explosion_direction = direction

func _on_drone_7_explote(direction: Vector2) -> void:
	player.explosion_direction = direction
