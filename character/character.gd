extends CharacterBody2D
class_name Character

@export var stats: CharacterStats : set = set_character_stats
@export var health_component: HealthComponent

@onready var wand := $Wand
@onready var sprite := $Sprite2D

func _ready():
	pass


func set_character_stats(value: CharacterStats) -> void:
	stats = value.create_instance()
	
	if not stats.stats_changed.is_connected(update_stats):
		stats.stats_changed.connect(update_stats)

	update_character()

# Das wird nötig, wenn man noch ein UI-Element beim Player hat.
func update_character() -> void:
	if not stats is CharacterStats: 
		return
	if not is_inside_tree(): 
		await ready
	update_stats()

# Das wird nötig, wenn man noch ein UI-Element beim Player hat.
func update_stats() -> void:
	pass


func cast():
	wand.request_cast()

# TODO: Schießen in eigene Component packen
func get_input():
	if Input.is_action_pressed("cast_left") or Input.is_action_pressed("cast_right") or Input.is_action_pressed("cast_up") or Input.is_action_pressed("cast_down"):
		var cast_direction := Input.get_vector("cast_left", "cast_right", "cast_up","cast_down")
		if cast_direction.x < 0:
			sprite.frame = 1
		elif cast_direction.x > 0:
			sprite.frame = 0
		wand.rotation = cast_direction.angle() + PI/2
		cast()

func _physics_process(_delta):
	get_input()


func _on_area_2d_body_entered(body):
	if body.is_in_group("enemies"):
		health_component.reduce_health(5)
