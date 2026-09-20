extends Node3D

var color_status := 0.0

func _process(delta: float) -> void:
	$MeshInstance3D.rotate_y(1 * delta)
	$DonutMeshInstance3D2.position.x += 1 * delta

	$DonutMeshInstance3D2.mesh.material.albedo_color = Color(color_status, 0.0, 0.0, 1.0)
	color_status += 0.005
