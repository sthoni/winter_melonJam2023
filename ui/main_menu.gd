extends Control

func _on_new_game_pressed() -> void:
	Events.new_game_pressed.emit()

func _on_exit_pressed() -> void:
	Events.exit_game_pressed.emit()
