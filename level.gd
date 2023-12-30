extends Node2D


@onready var enemies_level_1 = [Global.EnemyType.BLUE,Global.EnemyType.GREEN, Global.EnemyType.GREEN, Global.EnemyType.BLUE]
@onready var spawners: Array[Node] = get_tree().get_nodes_in_group("spawner")
@onready var timer:float = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	for enemy in enemies_level_1:
		var new_enemy = spawners[randi() % spawners.size()].create_enemy(enemy)
		get_parent().add_child.call_deferred(new_enemy)
	Global.kill.connect(level_up)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if timer > 0:
		timer -= delta
		if timer <= 0:
			$LevelUp.visible = false
	
func level_up():
	$LevelUp.visible = true
	$LevelUp/Animation.current_animation = "level_up"
	timer = 1.9

