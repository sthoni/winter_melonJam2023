class_name VelocityInput
extends Node

@export var actor: Actor
var velocity: Vector2

func get_velocity(_delta: float) -> Vector2:
	return velocity
