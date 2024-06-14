extends Node
@export var enemy : PackedScene
@export var helper : PackedScene
func _ready():
	$RoundFinished.size = Vector2(1152, 648)
	$RoundFinished.hide()
func _process(delta):
	if Input.is_action_pressed("play") and $RoundFinished.is_visible():
		get_tree().reload_current_scene()
func _on_timer_timeout():
	var enemies = enemy.instantiate()
	var helpers = helper.instantiate()
	var spawn_location = $Spawn/SpawnPath
	var random_spawn = 1 if randf() < 0.6 else 2
	spawn_location.progress_ratio = randf()
	if random_spawn == 1:
		enemies.position = spawn_location.position
		add_child(enemies)
	else:
		helpers.position = spawn_location.position
		add_child(helpers)
	$SpawnTimer.start()
func _on_hit_zone_dead(kind):
	$SpawnTimer.stop()
	get_tree().call_group("mobs", "queue_free")
	$RoundFinished.show()
func _on_harder_timer_timeout():
	if $SpawnTimer.wait_time == 0.25:
		$SpawnTimer.wait_time = 0.10
	else:
		$SpawnTimer.wait_time -= 0.25
func _on_hit_zone_hit(type, num):
	if type == 1:
		$LivesLabel.text = str(num)
	else:
		$GoalLabel.text = str(num)
