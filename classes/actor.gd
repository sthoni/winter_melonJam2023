class_name Actor
extends CharacterBody2D

@export var stats: Stats: set = set_stats

@onready var sprite: Sprite2D = $Sprite2D
@onready var health_component: HealthComponent = $HealthComponent
@onready var movement_component: MovementComponent = $MovementComponent

func set_stats(_value: Stats) -> void:
	pass