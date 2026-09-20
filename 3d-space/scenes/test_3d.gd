extends Node3D

func _process(delta: float) -> void:
	$MeshInstance3D.rotate_x(1 * delta)
