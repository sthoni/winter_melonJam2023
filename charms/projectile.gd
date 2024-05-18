extends Area2D

class_name Projectile

@export var charm: Charm : set = set_charm

@onready var area_of_effect: Area2D = $AreaOfEffect
@onready var sprite: Sprite2D = $Sprite2D


func set_charm(value: Charm) -> void:
	if not is_node_ready():
		await ready
	charm = value
	sprite.texture = charm.icon
	area_of_effect.apply_scale(Vector2(charm.area_of_effect, charm.area_of_effect))

func _physics_process(delta):
	position += - transform.y * charm.speed * delta


func _on_Bullet_body_entered(body: Node2D):
	if body is Character:
		return
	if body.is_in_group("enemies"):
		var targets = area_of_effect.get_overlapping_bodies()
		charm.apply_effects(targets)
	queue_free()
