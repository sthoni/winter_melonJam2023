class_name CharacterStats
extends Stats

@export_group("Visuals")
@export var character_name: String
@export_multiline var description: String
@export var portrait: Texture

@export_group("Gameplay Data")
@export var starting_charms: CharmBook
@export var max_mana: int

var mana: int: set = set_mana
var charm_book: CharmBook

func set_mana(value: int) -> void:
	mana = value
	stats_changed.emit()

func reset_mana() -> void:
	self.mana = max_mana

func can_cast_charm(charm: Charm) -> bool:
	return mana >= charm.cost

func _on_stats_changed() -> void:
	stats_changed.emit()

func create_instance() -> CharacterStats:
	var instance: CharacterStats = self.duplicate()
	instance.reset_mana()
	instance.health_stats = health_stats.create_instance()
	instance.movement_stats = movement_stats.create_instance()
	instance.charm_book = instance.starting_charms.create_instance()
	instance.health_stats.health_stats_changed.connect(instance._on_stats_changed)
	instance.movement_stats.movement_stats_changed.connect(instance._on_stats_changed)
	instance.charm_book.charm_selected_changed.connect(instance._on_stats_changed)
	return instance
