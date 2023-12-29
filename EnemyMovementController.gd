extends Node
class_name EnemyMovementController

@export var SPEED: float = 1.0
var player: Character

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_tree().get_first_node_in_group("player")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func calculate_movement(self_position) -> Vector2:
	var direction = player.global_position - self_position
	var new_position = direction.normalized() * SPEED + self_position
	return new_position
