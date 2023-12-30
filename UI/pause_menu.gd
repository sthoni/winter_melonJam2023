extends Control
@onready var main = $"../"
@onready var resume = $MarginContainer/VBoxContainer/Resume
@onready var gameover = $MarginContainer/VBoxContainer/GameOver
@onready var score_container = $MarginContainer/VBoxContainer/ScoreContainer
@onready var score = $MarginContainer/VBoxContainer/ScoreContainer/HBoxContainer/score
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func game_over():
	resume.disabled = true
	gameover.visible = true
	score_container.visible = true
	score.text = str(Global.number_killed_enemies)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_quit_pressed():
	get_tree().quit()

func _on_new_game_pressed():
	Global.global_clear()
	gameover.visible = false
	resume.disabled = false
	gameover.visible = false
	score_container.visible = false
	main.pauseMenu(false) #reset engine time scale to 1 
	get_tree().reload_current_scene()

func _on_resume_pressed():
	main.pauseMenu(false)
