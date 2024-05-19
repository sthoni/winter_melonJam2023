extends Resource

class_name MovementStats

@export var max_speed: float = 300.0
@export var acceleration: float = 1000.0
@export var friction: float = 500.0


func slow_down(amount: int) -> void:
	if self.max_speed - amount > 0:
		self.max_speed -= amount
	else:
		self.max_speed = 10

func speed_up(amount: int) -> void:
	self.max_speed += amount
