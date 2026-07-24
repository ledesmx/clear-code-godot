extends Control

func _ready() -> void:
	$ScoreText.text = "Current Score: " + str(Global.score)

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("run"):
		get_tree().change_scene_to_file("res://scenes/game.tscn")
