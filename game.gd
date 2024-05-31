class_name Game
extends Node

const MAIN_MENU := preload ("res://ui/main_menu.tscn")
const GAME_OVER_MENU := preload ("res://ui/game_over_menu.tscn")
const LEVEL := preload ("res://level/level.tscn")

@export var music: AudioStream
@export var start_level: int = 1
@export var start_character: CharacterStats
@export var level_enemy_pools: Array[EnemyPool]

@onready var current_view: Node = $CurrentView
@onready var pause_menu: PauseMenu = $PauseMenu

var char_stat: CharacterStats
var current_level: int
var pause_possible: bool

func _ready() -> void:
	@warning_ignore("return_value_discarded")
	Events.new_game_pressed.connect(_on_new_game_pressed)
	@warning_ignore("return_value_discarded")
	Events.main_menu_pressed.connect(_on_main_menu_pressed)
	@warning_ignore("return_value_discarded")
	Events.exit_game_pressed.connect(_on_exit_game_pressed)
	@warning_ignore("return_value_discarded")
	Events.character_died.connect(_on_character_died)
	@warning_ignore("return_value_discarded")
	Events.all_enemies_died.connect(_on_all_enemies_died)

	MusicPlayer.play(music, true)

	@warning_ignore("return_value_discarded")
	_change_view(MAIN_MENU)

func _change_view(scene: PackedScene) -> Node:
	if current_view.get_child_count() > 0:
		current_view.get_child(0).queue_free()

	get_tree().paused = false
	var new_view := scene.instantiate()
	current_view.add_child(new_view)
	return new_view

func _on_new_game_pressed() -> void:
	current_level = start_level
	pause_possible = true
	char_stat = start_character.create_instance()
	start_next_level()

func _on_main_menu_pressed() -> void:
	pause_possible = false
	@warning_ignore("return_value_discarded")
	_change_view(MAIN_MENU)

func _on_exit_game_pressed() -> void:
	get_tree().quit()

func _on_all_enemies_died() -> void:
	print("[DEBUG] Alle Gegner besiegt. Pause...")
	@warning_ignore("return_value_discarded")
	get_tree().create_timer(2, false).timeout.connect(
		func() -> void:
			if pause_possible:
				current_level += 1
				print("[DEBUG] Current Level %s" % [current_level])
				start_next_level()
	)

func start_next_level() -> void:
	var level_scene: Level = _change_view(LEVEL) as Level
	level_scene.char_stats = char_stat
	level_scene.enemy_pool = level_enemy_pools[current_level % level_enemy_pools.size() - 1]
	level_scene.start_level()

func _on_character_died() -> void:
	pause_possible = false
	@warning_ignore("return_value_discarded")
	_change_view(GAME_OVER_MENU)

# TODO: Daten des Durchgangs könnten noch gespeichert werden.

# Die Level haben jetzt feste Gegner. Hat Vor- und Nachteile.
# Wahrscheinlich wäre eine Kombination aus zufälligen und festgelegten Gegnern gut.

# Pausen-Menü
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause") and pause_possible:
		if pause_menu.visible:
			_unpause()
		else:
			_pause()
			
		get_viewport().set_input_as_handled()

func _pause() -> void:
	pause_menu.show()
	get_tree().paused = true

func _unpause() -> void:
	pause_menu.hide()
	get_tree().paused = false
