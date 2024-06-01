class_name CharacterMovementVelocityInput
extends VelocityInput

func get_velocity(delta: float) -> Vector2:
	var input := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if input.length() > 0:
		velocity = actor.velocity.move_toward(input * actor.stats.movement_stats.speed, actor.stats.movement_stats.acceleration * delta)
	else:
		velocity = actor.velocity.move_toward(Vector2.ZERO, actor.stats.movement_stats.friction * delta)
	return velocity
