extends Node
class_name HealthComponent

signal health_depleted

@export var MAX_HEALTH: int
@onready var current_health: int = MAX_HEALTH

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func reduce_health(amount):
	current_health -= amount
	if current_health < 1:
		current_health = 0
		emit_signal("health_depleted")


func add_health(amount):
	if current_health + amount < MAX_HEALTH:
		current_health += amount
	else:
		current_health = MAX_HEALTH
