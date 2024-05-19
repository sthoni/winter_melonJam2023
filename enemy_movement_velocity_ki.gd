extends Node

class_name  EnemyMovementVelocityKi

@export var actor: CharacterBody2D
@export var movement_stats: MovementStats
var player: Character

func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")
	movement_stats.max_speed = Global.STANDARDSPEED

func _physics_process(delta: float) -> void:
	var direction = player.global_position - actor.position
	#var tempspeed = movement_stats.max_speed - 50
	if direction.length() > 0:
		actor.velocity = actor.velocity.move_toward(direction.normalized() * movement_stats.max_speed, movement_stats.acceleration * delta)
	else:
		actor.velocity = actor.velocity.move_toward(Vector2.ZERO, movement_stats.friction * delta)
