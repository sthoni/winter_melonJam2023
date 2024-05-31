class_name Stats
extends Resource

signal stats_changed

@export_group("Visuals")
@export var sprite: Texture
@export var art: Texture

@export_group("Sub-Stats")
@export var movement_stats: MovementStats
@export var health_stats: HealthStats

func create_instance() -> Resource:
	var instance: Stats = self.duplicate()
	instance.movement_stats = movement_stats.create_instance()
	instance.health_stats = health_stats.create_instance()
	return instance
