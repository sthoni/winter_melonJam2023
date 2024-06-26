class_name Charm
extends Resource

enum Type {PROJECTILE}

@export_group("Charms Attributes")
@export var id: String
@export var type: Type
@export var cost: int
@export var speed: int
@export var area_of_effect: float
@export var cast_time: float

@export_group("Charms Visuals")
@export var icon: Texture
@export_multiline var tooltip_text: String
@export var sound: AudioStream

func cast() -> void:
	Events.charm_cast.emit(self)

func apply_effects(_targets: Array[Actor]) -> void:
	pass

func get_default_tooltip() -> String:
	return tooltip_text

func _to_string() -> String:
	return id
