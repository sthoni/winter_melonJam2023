class_name Stats
extends Resource

signal stats_changed

@export var art: Texture
@export var movement_stats: MovementStats
@export var health_stats: HealthStats


func create_instance() -> Resource:
	var instance: Stats = self.duplicate()
	instance.movement_stats = movement_stats.duplicate(true)
	instance.health_stats = health_stats.create_instance()
	return instance
