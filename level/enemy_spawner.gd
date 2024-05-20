class_name EnemySpawner

extends Node

@export var enemy_pool: EnemyPool

@onready var enemy_scene: PackedScene = preload("res://enemies/enemy.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func create_enemy() -> Enemy:
	var enemy: Enemy = enemy_scene.instantiate()
	enemy.stats = enemy_pool.enemies[randi_range(0,enemy_pool.enemies.size() - 1)]
	enemy.position = self.position + Vector2(randi_range(-5, 5), randi_range(-5, 5))
	return enemy
