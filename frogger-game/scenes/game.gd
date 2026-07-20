extends Node2D

var green_car_scene: PackedScene = preload("res://green_car.tscn")


func _on_area_2d_body_entered(body: Node2D) -> void:
	print("hola")


func _on_car_timer_timeout() -> void:
	var car = green_car_scene.instantiate() as Area2D
	var start_markers = $CarStartPositions.get_children().pick_random() as Marker2D
	car.position = start_markers.position
	$Objects.add_child(car)
