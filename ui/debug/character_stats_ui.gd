class_name CharacterStatsUi
extends Control

@export var char_stats: CharacterStats: set = set_char_stats

@onready var health_label: Label = %HealthLabel
@onready var movement_label: Label = %MovementLabel
@onready var charms_label: Label = %CharmsLabel

func _ready() -> void:
	set_char_stats(char_stats)
	@warning_ignore("return_value_discarded")
	Events.charm_changed.connect(_on_charm_changed)

func set_char_stats(value: CharacterStats) -> void:
	char_stats = value
	
	if not is_node_ready():
		await ready

	if not char_stats.health_stats.health_stats_changed.is_connected(_on_health_stats_changed):
		@warning_ignore("return_value_discarded")
		char_stats.health_stats.health_stats_changed.connect(_on_health_stats_changed)

	if not char_stats.movement_stats.movement_stats_changed.is_connected(_on_movement_stats_changed):
		@warning_ignore("return_value_discarded")
		char_stats.movement_stats.movement_stats_changed.connect(_on_movement_stats_changed)

	_on_health_stats_changed()
	_on_movement_stats_changed()

func _on_health_stats_changed() -> void:
	health_label.text = "Leben: %s/%s" % [char_stats.health_stats.health, char_stats.health_stats.max_health]

func _on_movement_stats_changed() -> void:
	movement_label.text = "Speed: %s/%s" % [char_stats.movement_stats.speed, char_stats.movement_stats.max_speed]

func _on_charm_changed(charm: Charm) -> void:
	charms_label.text = "Charm: %s" % [charm._to_string()]