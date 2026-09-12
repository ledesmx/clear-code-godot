extends Node2D

var bullet_scene: PackedScene = preload("res://scenes/bullet.tscn")
@onready var player := $entities/Player
@onready var drone := $Drone

func _process(delta: float) -> void:
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
