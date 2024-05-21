extends Resource

class_name MovementStats

signal movement_stats_changed

@export var max_speed: float = 300.0
@export var start_speed: float = 200.0
@export var acceleration: float = 1000.0
@export var friction: float = 500.0

var speed: int : set = set_speed

func set_speed(value : int) -> void:
	speed = clampi(value, 0, start_speed)
	movement_stats_changed.emit()


func slow_down(amount: int) -> void:
	if self.speed - amount > 0:
		self.speed -= amount
	else:
		self.speed = 10


func speed_up(amount: int) -> void:
	if self.speed + amount < self.max_speed:
		self.speed += amount
	else:
		self.speed = self.max_speed


func create_instance() -> MovementStats:
	var instance: MovementStats = self.duplicate()
	instance.speed = start_speed
	return instance
