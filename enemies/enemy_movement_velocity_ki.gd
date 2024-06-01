class_name EnemyMovementVelocityKi
extends VelocityInput

var player: Character

func get_velocity(delta: float) -> Vector2:
	player = get_tree().get_first_node_in_group("player")
	if player:
		var direction := player.global_position - actor.position
		if direction.length() > 0:
			velocity = actor.velocity.move_toward(direction.normalized() * actor.stats.movement_stats.speed, actor.stats.movement_stats.acceleration * delta)
		else:
			velocity = actor.velocity.move_toward(Vector2.ZERO, actor.stats.movement_stats.friction * delta)
	return velocity
