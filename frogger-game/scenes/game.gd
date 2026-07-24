extends Node2D

var green_car_scene: PackedScene = preload("res://scenes/car.tscn")
var score: int = 0


func _on_car_timer_timeout() -> void:
	var car = green_car_scene.instantiate() as Area2D
	var start_markers = $CarStartPositions.get_children().pick_random() as Marker2D
	car.position = start_markers.position
	$Objects.add_child(car)
	
	car.connect("body_entered", go_to_title)

func go_to_title(_body):
	call_deferred("change_to_title_scene")


func _on_finish_area_body_entered(_body: Node2D) -> void:
	call_deferred("change_to_title_scene")

func change_to_title_scene():
	get_tree().change_scene_to_file("res://scenes/title.tscn")

func _on_score_timer_timeout() -> void:
	score += 1
	var text_format = "Score: {score} PTS"
	$CanvasLayer/Score.text = text_format.format({"score": score})
