class_name GameOverMenu
extends Control

func _on_quit_pressed():
	Events.exit_game_pressed.emit()

func _on_new_game_pressed():
	Events.new_game_pressed.emit()

func _on_main_menu_pressed():
	Events.main_menu_pressed.emit()