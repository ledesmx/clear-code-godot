extends Node2D

var green_car_scene: PackedScene = preload("res://scenes/green_car.tscn")


func _on_car_timer_timeout() -> void:
	var car = green_car_scene.instantiate() as Area2D
	var start_markers = $CarStartPositions.get_children().pick_random() as Marker2D
	car.position = start_markers.position
	$Objects.add_child(car)
	
	car.connect("body_entered", go_to_title)

func go_to_title(body):
	print(body)
	print("Game over. Go to title")


func _on_finish_area_body_entered(_body: Node2D) -> void:
	print("Winner")
