class_name PauseMenu
extends Control

@onready var continue_button: Button = %Continue
@onready var main_menu_button: Button = %MainMenu
@onready var exit_button: Button = %Exit

func _on_main_menu_pressed() -> void:
	Events.main_menu_pressed.emit()
	hide()

func _on_exit_pressed() -> void:
	Events.exit_game_pressed.emit()
