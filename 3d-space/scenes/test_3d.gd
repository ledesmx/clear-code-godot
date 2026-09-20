extends Node3D

func _process(delta: float) -> void:
	$MeshInstance3D.rotate_y(1 * delta)
