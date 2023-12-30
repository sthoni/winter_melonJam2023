extends Control
@onready var main = $"../"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_quit_pressed():
	get_tree().quit()

func _on_new_game_pressed():
	Global.global_clear()
	main.pauseMenu() #reset engine time scale to 1 
	get_tree().reload_current_scene()

func _on_resume_pressed():
	main.pauseMenu()
