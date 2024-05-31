class_name EnemySpawner
extends Marker2D

@onready var enemy_scene: PackedScene = preload ("res://enemies/enemy.tscn")

func create_enemy(enemy_stats: EnemyStats) -> Enemy:
	var enemy: Enemy = enemy_scene.instantiate()
	enemy.stats = enemy_stats
	enemy.position = self.position + Vector2(randi_range( - 5, 5), randi_range( - 5, 5))
	return enemy
