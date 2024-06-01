class_name Projectile
extends Area2D

@export var charm: Charm: set = set_charm

@onready var area_of_effect: Area2D = $AreaOfEffect
@onready var sprite: Sprite2D = $Sprite2D

var caster: Actor

func set_charm(value: Charm) -> void:
	if not is_node_ready():
		await ready
	charm = value
	sprite.texture = charm.icon
	area_of_effect.apply_scale(Vector2(charm.area_of_effect, charm.area_of_effect))

func _physics_process(delta: float) -> void:
	position += - transform.y * charm.speed * delta

func _on_body_entered(body: Node2D) -> void:
	if body == caster:
		return
	var overlapping_bodies := area_of_effect.get_overlapping_bodies()
	var targets: Array[Actor] = []
	for overlapping_body in overlapping_bodies:
		if body is Actor:
			targets.append(body)
	charm.apply_effects(targets)
	queue_free()
