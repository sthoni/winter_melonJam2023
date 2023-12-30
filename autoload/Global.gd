extends Node

signal kill

var number_killed_enemies = 0
enum EnemyType {GREEN,BLUE,RED,YELLOW}

func _on_enemy_health_depleted():
	number_killed_enemies += 1
	emit_signal("kill")
	if number_killed_enemies == 2:
		pass
