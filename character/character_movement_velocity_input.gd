class_name CharacterMovementVelocityInput
extends Node

@export var actor: Actor

func _physics_process(delta: float) -> void:
	var input := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if input.length() > 0:
		actor.velocity = actor.velocity.move_toward(input * actor.stats.movement_stats.speed, actor.stats.movement_stats.acceleration * delta)
	else:
		actor.velocity = actor.velocity.move_toward(Vector2.ZERO, actor.stats.movement_stats.friction * delta)
