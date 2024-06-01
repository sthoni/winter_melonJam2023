class_name CastInput
extends Node

var cast_direction: Vector2 = Vector2.ZERO

func get_cast_intention() -> bool:
	return false

func get_cast_direction() -> Vector2:
	return cast_direction