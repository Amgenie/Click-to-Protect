extends Control
func _on_hit_zone_dead(kind):
	if kind == 0:
		$RoundText.text = "Game Over!"
	else:
		$RoundText.text = "Game Won!"
