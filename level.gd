extends Node2D


@onready var enemies_in_level = [
	[Global.EnemyType.BLUE, Global.EnemyType.BLUE],
	[Global.EnemyType.GREEN, Global.EnemyType.GREEN],
	[Global.EnemyType.GREEN, Global.EnemyType.GREEN, Global.EnemyType.GREEN],
	[Global.EnemyType.GREEN, Global.EnemyType.GREEN, Global.EnemyType.GREEN, Global.EnemyType.BLUE, Global.EnemyType.BLUE]
	]
@onready var spawners: Array[Node] = get_tree().get_nodes_in_group("spawner")
@onready var active_level := 0

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.level_finished.connect(next_level)
	spawn_enemies(active_level)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func spawn_enemies(level):
	for enemy in enemies_in_level[active_level]:
		var new_enemy = spawners[randi() % spawners.size()].create_enemy(enemy)
		get_parent().add_child.call_deferred(new_enemy)

func next_level():
	active_level += 1
	spawn_enemies(active_level)
