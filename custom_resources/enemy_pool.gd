class_name EnemyPool

extends Resource

@export var enemies: Array[EnemyStats] = []

func add_enemy(enemy: EnemyStats) -> void:
	enemies.append(enemy)


func _to_string() -> String:
	var _enemy_strings: PackedStringArray = []
	for i in enemies.size():
		_enemy_strings.append("%s: %s" % [i+1, enemies[i].id])
	return "\n".join(_enemy_strings)
