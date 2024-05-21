extends Resource
class_name HealthStats

signal health_stats_changed

@export var max_health := 1

var health: int : set = set_health

func set_health(value : int) -> void:
	health = clampi(value, 0, max_health)
	health_stats_changed.emit()


func take_damage(damage : int) -> void:
	if damage <= 0:
		return
	var initial_damage = damage
	damage = clampi(damage, 0, damage) # Da war ursprünglich noch Block drin
	self.health -= damage


func heal(amount : int) -> void:
	self.health += amount


func create_instance() -> HealthStats:
	var instance: HealthStats = self.duplicate()
	instance.health = max_health
	return instance
