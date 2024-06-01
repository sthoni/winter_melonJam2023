class_name CharacterStatsUi
extends Control

@export var char_stats: CharacterStats: set = set_char_stats

@onready var health_label: Label = %HealthLabel
@onready var movement_label: Label = %MovementLabel
@onready var charms_label: Label = %CharmsLabel

func set_char_stats(value: CharacterStats) -> void:
	char_stats = value
	
	if not is_node_ready():
		await ready
	
	if not get_parent().is_node_ready():
		await ready

	if not char_stats.stats_changed.is_connected(_on_stats_changed):
		char_stats.stats_changed.connect(_on_stats_changed)

	_on_stats_changed()

func _on_stats_changed() -> void:
	health_label.text = "Leben: %s/%s" % [char_stats.health_stats.health, char_stats.health_stats.max_health]
	movement_label.text = "Speed: %s/%s" % [char_stats.movement_stats.speed, char_stats.movement_stats.max_speed]
	if char_stats.charm_book:
		charms_label.text = "Charm: %s" % [char_stats.charm_book.charm_selected]
	else:
		charms_label.text = "Charm: Keine"
