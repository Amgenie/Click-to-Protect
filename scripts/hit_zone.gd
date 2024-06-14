extends Area2D
var lives := 3
var goal = 20
signal dead(kind)# goal reached(1) or died(0)
signal hit(type, num)# (1 is enemy, 2 is helper), (number of lives/goals left)
func _on_area_entered(area):
	if area is Enemy:
		lives -= 1 if lives > 0 else 0
		$hurt.play()
		hit.emit(1, lives)
	elif area is Helper:
		goal -= 1 if goal > 0 else 0
		$goal.play()
		hit.emit(2, goal)
	area.queue_free()
func _process(delta):
	if lives == 0:
		dead.emit(0)
	elif goal == 0:
		dead.emit(1)
