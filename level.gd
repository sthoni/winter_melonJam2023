extends Node2D

@onready var spawners: Array[Node] = get_tree().get_nodes_in_group("spawner")
@onready var active_level := 0
@onready var timer:float = 0
@onready var pause_menu = $PauseMenu
var paused = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pause_menu.hide()
	Global.level_finished.connect(next_level)
	spawn_enemies(active_level)
	Global.kill.connect(level_up)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_menu"):
		pauseMenu(false)	
	if timer > 0:
		timer -= delta
		if timer <= 0:
			$LevelUp.visible = false
	
func level_up():
	$LevelUp.visible = true
	$LevelUp/Animation.current_animation = "level_up"
	timer = 1.9


func spawn_enemies(level):
	for enemy in range(active_level+1):
		var enemy_type = randi() % Global.EnemyType.size()
		var new_enemy = spawners[randi() % spawners.size()].create_enemy(enemy_type)
		add_child.call_deferred(new_enemy)

func next_level():
	active_level += 1
	spawn_enemies(active_level)
	
func pauseMenu(dead:bool):
	if dead:
		pause_menu.show()
		pause_menu.game_over()
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0
		
	paused = !paused
	
