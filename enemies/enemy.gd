extends CharacterBody2D
class_name Enemy

@export var stats: EnemyStats: set = set_enemy_stats

@onready var sprite: Sprite2D = $Sprite2D

func set_enemy_stats(value: EnemyStats) -> void:
	stats = value.create_instance()
	if not sprite:
		await ready
	sprite.texture = stats.sprite
