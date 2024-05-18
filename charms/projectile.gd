extends Area2D

class_name Projectile

@export var charm: Charm : set = set_charm

@onready var collision_shape: CollisionShape2D = $CollisionShape2D
@onready var sprite: Sprite2D = $Sprite2D


func set_charm(value: Charm) -> void:
	if not is_node_ready():
		await ready
	charm = value
	sprite.texture = charm.icon

func _physics_process(delta):
	position += - transform.y * charm.speed * delta


func _on_Bullet_body_entered(body):
	if body.is_in_group("enemies"):
		charm.apply_effects([body])
	queue_free()
