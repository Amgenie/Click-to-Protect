extends Area2D
class_name Helper
var can_die := false
var moving = true
func _process(delta):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and can_die == true:
		moving = false
		$AnimationPlayer.play("killed")
	if moving == true:
		position.x -= 5
func _on_mouse_entered():
	can_die = true
func _on_mouse_exited():
	can_die = false
