extends Node
class_name EnemySpawner

@onready var enemy_green_resource = preload("res://enemies/enemy_green.tscn")
@onready var enemy_blue_resource = preload("res://enemies/enemy_blue.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func create_enemy(type: Global.EnemyType) -> Enemy:
	var enemy: Enemy
	match type:
		Global.EnemyType.BLUE:
			enemy = enemy_blue_resource.instantiate()
		Global.EnemyType.GREEN:
			enemy = enemy_green_resource.instantiate()
	enemy.position = self.position + Vector2(randi_range(-5, 5), randi_range(-5, 5))
	return enemy
