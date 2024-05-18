extends Node

signal level_finished
signal kill(pos:Vector2)

var number_killed_enemies = 0
enum EnemyType {RED, YELLOW, GREEN, BLUE}
enum PickableType {PLATANO, ARMOR1, WIGGLEWAND, MOVEFAST}

func _on_enemy_health_depleted(pos:Vector2):
	number_killed_enemies += 1
	emit_signal("kill", pos)
	if check_level_finished():
		emit_signal("level_finished")

func check_level_finished() -> bool:
	var enemies = get_tree().get_nodes_in_group("mobs")
	if enemies.size() == 1:
		return true
	else:
		return false
		
func global_clear():
	number_killed_enemies = 0
