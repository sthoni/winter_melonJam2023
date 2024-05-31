class_name Level
extends Node2D

@export var enemy_pool: EnemyPool
@export var char_stats: CharacterStats

@onready var spawners: Array[EnemySpawner]
@onready var pickable_spawner: PickableSpawner = $PickableSpawner
@onready var character_stats_ui: CharacterStatsUi = $CharacterStatsUi
@onready var character: Character = $Character

var enemies_in_level: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Events.enemy_died.connect(_on_enemy_died)
	for child in get_children():
		if child is EnemySpawner:
			spawners.append(child)

func start_level() -> void:
	get_tree().paused = false
	character.stats = char_stats
	character_stats_ui.char_stats = char_stats
	spawn_enemies()

func spawn_pickable(pos: Vector2) -> void:
	var pickable_type := randi() % 2 # Global.PickableKind.size()
	var new_pickable: Pickable = pickable_spawner.create_pickable(pickable_type)
	new_pickable.position = pos
	add_child.call_deferred(new_pickable)

func spawn_enemies() -> void:
	for enemy_stats in enemy_pool.enemies:
		var new_enemy: Enemy = spawners[randi() % spawners.size()].create_enemy(enemy_stats)
		add_child.call_deferred(new_enemy)
		enemies_in_level += 1
		Events.enemy_spawned.emit()

func _on_enemy_died(enemy: Enemy) -> void:
	spawn_pickable(enemy.position)
	enemies_in_level -= 1
	if enemies_in_level == 0:
		Events.all_enemies_died.emit()