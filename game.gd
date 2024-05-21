class_name Game

extends Node

const MAIN_MENU := preload("res://ui/main_menu.tscn")

@onready var current_view: Node = $CurrentView

func _ready() -> void:
	_change_view(MAIN_MENU)


func _change_view(scene: PackedScene) -> void:
	if current_view.get_child_count() > 0:
		current_view.get_child(0).queue_free()

	get_tree().paused = false
	var new_view := scene.instantiate()
	current_view.add_child(new_view)
