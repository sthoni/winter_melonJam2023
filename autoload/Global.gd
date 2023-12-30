extends Node

signal two_kills
signal level_finished

var number_killed_enemies = 0
enum EnemyType {GREEN,BLUE,RED,YELLOW}

func _on_enemy_health_depleted():
	number_killed_enemies += 1
	if number_killed_enemies == 2:
		emit_signal("two_akills")
	if check_level_finished():
		emit_signal("level_finished")

func check_level_finished() -> bool:
	var enemies = get_tree().get_nodes_in_group("mobs")
	if enemies.size() == 1:
		return true
	else:
		return false
