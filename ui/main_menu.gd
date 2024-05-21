extends Control

@onready var gamescene = preload("res://level/level.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_new_run_pressed() -> void:
	get_tree().change_scene_to_packed(gamescene)


func _on_exit_pressed() -> void:
	get_tree().quit()
