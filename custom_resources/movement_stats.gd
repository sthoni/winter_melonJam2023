extends Resource

class_name MovementStats

signal movement_stats_changed

@export var max_speed: float = 300.0
@export var start_speed: float = 200.0
@export var acceleration: float = 1000.0
@export var friction: float = 500.0

var speed: float: set = set_speed

func set_speed(value: float) -> void:
	speed = clampf(value, 10.0, max_speed)
	movement_stats_changed.emit()

func slow_down(amount: int) -> void:
	self.speed -= amount

func speed_up(amount: int) -> void:
	self.speed += amount

func create_instance() -> MovementStats:
	var instance: MovementStats = self.duplicate()
	instance.speed = start_speed
	return instance
