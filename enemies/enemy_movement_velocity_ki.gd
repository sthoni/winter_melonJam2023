class_name EnemyMovementVelocityKi
extends Node

@export var actor: CharacterBody2D
var player: Character

func _physics_process(delta: float) -> void:
	player = get_tree().get_first_node_in_group("player")
	if player:
		var direction = player.global_position - actor.position
		if direction.length() > 0:
			actor.velocity = actor.velocity.move_toward(direction.normalized() * actor.stats.movement_stats.speed, actor.stats.movement_stats.acceleration * delta)
		else:
			actor.velocity = actor.velocity.move_toward(Vector2.ZERO, actor.stats.movement_stats.friction * delta)
