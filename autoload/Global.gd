extends Node

signal two_kills

var number_killed_enemies = 0
enum EnemyType {GREEN,BLUE,RED,YELLOW}

func _on_enemy_health_depleted():
	number_killed_enemies += 1
	if number_killed_enemies == 2:
		emit_signal("two_akills")
		
