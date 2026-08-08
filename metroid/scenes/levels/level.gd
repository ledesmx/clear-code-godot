extends Node2D

var bullet_scene: PackedScene = preload("res://scenes/bullet.tscn")


func _on_player_shoot(player_position: Vector2, direction: Vector2) -> void:
	print(player_position)
	print(direction)
	
	var bullet = bullet_scene.instantiate() as Node2D
	bullet.position = player_position + direction * 16
	bullet.direction = direction
	add_child(bullet)
	
