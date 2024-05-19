class_name CharacterStats
extends Stats

@export_group("Visuals")
@export var character_name: String
@export_multiline var description: String
@export var portrait: Texture

@export_group("Gameplay Data")
@export var starting_charms: CharmBook
@export var max_mana: int

var mana: int : set = set_mana
var charm_book: CharmBook 


func set_mana(value: int) -> void:
	mana = value
	stats_changed.emit()


func reset_mana() -> void:
	self.mana = max_mana


func take_damage(damage: int) -> void:
	var initial_health := health
	super.take_damage(damage)
	if initial_health > health:
		Events.player_hit.emit()


func can_cast_charm(charm: Charm) -> bool:
	return mana >= charm.cost


func create_instance() -> Resource:
	var instance: CharacterStats = self.duplicate()
	instance.health = max_health
	instance.reset_mana()
	instance.charm_book = instance.starting_charms.duplicate(true)
	return instance
