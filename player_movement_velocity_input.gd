extends Node

class_name  PlayerMovementVelocityInput

@export var actor: CharacterBody2D
@export var movement_stats: MovementStats

func _ready() -> void:
	movement_stats.max_speed = Global.STANDARDSPEED
	
func _physics_process(delta: float) -> void:
	var input := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if input.length() > 0:
		actor.velocity = actor.velocity.move_toward(input * movement_stats.max_speed, movement_stats.acceleration * delta)
	else:
		actor.velocity = actor.velocity.move_toward(Vector2.ZERO, movement_stats.friction * delta)
