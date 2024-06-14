extends Control
func _process(delta):
	if Input.is_action_pressed("play"):
			get_tree().change_scene_to_file("res://scenes/tutorial.tscn")
