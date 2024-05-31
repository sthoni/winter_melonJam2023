class_name Character
extends CharacterBody2D

@export var stats: CharacterStats: set = set_character_stats
@export var health_component: HealthComponent

@onready var wand := $Wand
@onready var sprite := $Sprite2D

func _ready():
	pass

func set_character_stats(value: CharacterStats) -> void:
	stats = value

func cast():
	wand.request_cast()

# TODO: Schießen in eigene Component packen
func get_input():
	if Input.is_action_pressed("cast_left") or Input.is_action_pressed("cast_right") or Input.is_action_pressed("cast_up") or Input.is_action_pressed("cast_down"):
		var cast_direction := Input.get_vector("cast_left", "cast_right", "cast_up", "cast_down")
		if cast_direction.x < 0:
			sprite.frame = 1
		elif cast_direction.x > 0:
			sprite.frame = 0
		wand.rotation = cast_direction.angle() + PI / 2
		cast()

func _physics_process(_delta):
	get_input()

func _on_area_2d_body_entered(body):
	if body.is_in_group("enemies"):
		health_component.reduce_health(5)