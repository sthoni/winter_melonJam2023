extends Control
@onready var main = $"../"
@onready var main_menu_scene = preload("res://UI/main_menu.tscn")

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
	#main.get_children().clear()
	#var root_children = get_tree().root.get_children()
	#for root_child in root_children:
		#if root_child.get_path() != load("/root/Level") or root_child.get_path() != load("/root/Global"):
			#root_child.free()
	get_tree().change_scene_to_packed(main_menu_scene)
	#get_tree().change_scene_to_packed(load("res://UI/main_menu.tscn"))
	#.change_scene(load("res://level.tscn"))
	#get_tree().change_scene(load("res://level.tscn"))

func _on_resume_pressed():
	main.pauseMenu()
